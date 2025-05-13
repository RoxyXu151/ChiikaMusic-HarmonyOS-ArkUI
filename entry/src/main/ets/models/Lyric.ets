/**
 * Lyric类用于解析和管理LRC格式的歌词文件
 */
import util from '@ohos.util';
import { GlobalMusic } from './GlobalMusic';

export interface Line {
  time: number;
  text: string;
}

interface Metadata {
  title: string;
  artist: string;
  album: string;
  by: string;
}


@ObservedV2
export class GlobalLyric{
  // 歌词元数据
  @Trace private title: string = ''; // 歌曲标题
  @Trace private artist: string = ''; // 艺术家
  @Trace private album: string = ''; // 专辑
  @Trace private by: string = ''; // 歌词制作者
  @Trace lrcContent: string = ''
  @Trace isLyricLoaded: boolean = false
  @Trace currentLyric: string = ''
  @Trace nextLyric: string = ''
  @Trace activeLyricIndex: number = -1
  @Trace scroller: Scroller = new Scroller() // 添加歌词滚动控制器
  // 上次更新AVSession状态的时间
  @Trace lastAVSessionUpdateTime: number = 0;
  @Trace lyricUpdateTimer: number = -1
  @Trace lyrics: Array<Line> = [];// 歌词内容，格式为 {time: 时间(毫秒), text: 歌词文本}

  // 当前显示的歌词索引
  @Trace private currentIndex: number = -1;

  /**
   * 从LRC文件内容解析歌词
   * @param lrcContent LRC文件内容
   */
  parseLrc(lrcContent: string): void {
    if (!lrcContent) {
      return;
    }

    // 清空现有歌词
    this.lyrics = [];
    this.currentIndex = -1;

    // 按行分割歌词内容
    const lines = lrcContent.split('\n');

    // 解析每一行
    for (const line of lines) {
      // 解析元数据标签
      if (line.startsWith('[ti:')) {
        this.title = line.substring(4, line.length - 1);
        continue;
      }
      if (line.startsWith('[ar:')) {
        this.artist = line.substring(4, line.length - 1);
        continue;
      }
      if (line.startsWith('[al:')) {
        this.album = line.substring(4, line.length - 1);
        continue;
      }
      if (line.startsWith('[by:')) {
        this.by = line.substring(4, line.length - 1);
        continue;
      }

      // 解析带时间戳的歌词行
      const timeRegex = /\[(\d{2}):(\d{2})\.(\d{2})\]/g;
      let match: RegExpExecArray | null;
      let text = line;
      let timePoints: number[] = [];

      // 提取所有时间戳
      while ((match = timeRegex.exec(line)) !== null) {
        const minutes = parseInt(match[1]);
        const seconds = parseInt(match[2]);
        const hundredths = parseInt(match[3]);
        const time = minutes * 60 * 1000 + seconds * 1000 + hundredths * 10; // 转换为毫秒
        timePoints.push(time);

        // 移除时间戳部分
        text = text.replace(match[0], '');
      }

      // 如果有时间戳，添加到歌词列表
      if (timePoints.length > 0) {
        text = text.trim(); // 移除前后空格
        for (const time of timePoints) {
          this.lyrics.push({ time, text });
        }
      }
    }

    // 按时间排序歌词
    this.lyrics.sort((a, b) => a.time - b.time);
  }

  /**
   * 从文件路径加载LRC歌词
   * @param filePath LRC文件路径
   */
  async loadFromFile(filePath: string): Promise<void> {
    try {
      // 使用资源管理器读取文件
      const context = getContext(this);
      const resourceManager = context.resourceManager;
      const fileContent = await resourceManager.getRawFileContent(filePath);
      const textDecoder = util.TextDecoder.create('utf-8');
      const lrcContent = textDecoder.decodeToString(fileContent, {stream: false});

      this.parseLrc(lrcContent);
    } catch (error) {
      console.error(`加载歌词文件失败: ${error instanceof Error ? error.message : String(error)}`);
    }
  }

  /**
   * 根据当前播放时间获取对应的歌词
   * @param currentTime 当前播放时间(毫秒)
   * @returns 当前时间对应的歌词文本
   */
  getLyricByTime(currentTime: number): string {
    if (this.lyrics.length === 0) {
      return '';
    }

    // 查找当前时间对应的歌词
    let index = -1;
    for (let i = 0; i < this.lyrics.length; i++) {
      if (this.lyrics[i].time <= currentTime) {
        index = i;
      } else {
        break;
      }
    }

    // 更新当前索引并返回歌词
    this.currentIndex = index;

    return index >= 0 ? this.lyrics[index].text : '';
  }

  /**
   * 获取当前歌词和下一句歌词
   * @param currentTime 当前播放时间(毫秒)
   * @returns 包含当前歌词和下一句歌词的对象
   */
  getCurrentAndNextLyric(currentTime: number): string[] {
    const current = this.getLyricByTime(currentTime);
    let next = '';

    if (this.currentIndex >= 0 && this.currentIndex < this.lyrics.length - 1) {
      next = this.lyrics[this.currentIndex + 1].text;
    }
    let res:string[]= [current,next]
    return res;
  }

  /**
   * 获取歌词元数据
   * @returns 包含歌词元数据的对象
   */
  getMetadata(): Metadata {
    return {
      title: this.title,
      artist: this.artist,
      album: this.album,
      by: this.by
    };
  }

  /**
   * 获取当前显示的歌词索引
   * @returns 当前歌词索引
   */
  getCurrentIndex(): number {
    return this.currentIndex;
  }

  // 获取歌词内容+解析歌词
  async fetchLyric(playState:GlobalMusic) {
    try {
      // 获取歌词内容
      if (playState.playList.length > 0 && playState.playerIndex >= 0) {
        const currentSong = playState.playList[playState.playerIndex];
        if (currentSong.lrc) { // 使用歌曲对象中的歌词
          this.lrcContent = currentSong.lrc;
          console.info(`使用歌曲[${currentSong.name}]的内置歌词，长度: ${this.lrcContent.length}`);
        } else {
          // 如果当前歌曲没有歌词属性，使用默认提示
          this.lrcContent = '';
          console.info(`歌曲[${currentSong.name}]没有内置歌词`);
        }
      } else {
        console.info('没有正在播放的歌曲');
        this.lrcContent = '';
      }

      // 解析歌词
      if (this.lrcContent) {
        this.parseLrc(this.lrcContent);
        console.info(`解析后歌词行数: ${this.lyrics.length}`);
        if (this.lyrics.length > 0) {
          console.info(`第一行歌词: ${this.lyrics[0].text}, 时间: ${this.lyrics[0].time}`);
        }
        this.isLyricLoaded = true;
        console.info('歌词加载成功');
      } else {
        this.isLyricLoaded = true; // 标记为已加载，但没有歌词内容
        console.info('没有可用的歌词');
      }
    } catch (error) {
      console.error(`获取歌词异常: ${error instanceof Error ? error.message : String(error)}`);
    }
  }


  // 更新当前显示的歌词
  updateLyric(playState:GlobalMusic) {
    if (this.isLyricLoaded && playState.time > 0) {
      const lyrics = this.getCurrentAndNextLyric(playState.time);
      this.currentLyric = lyrics[0];
      this.nextLyric = lyrics[1];
      this.activeLyricIndex = this.getCurrentIndex();

      // 如果有活跃的歌词行，滚动到该行，使其居中显示
      if (this.activeLyricIndex >= 0) {
        this.scroller.scrollToIndex(this.activeLyricIndex, true,ScrollAlign.CENTER);
      }

      // 限制AVSession状态更新频率，每2秒最多更新一次
      const currentTime = new Date().getTime();
      if (currentTime - this.lastAVSessionUpdateTime > 200) {
        // 这里不直接调用avSessionManager.setAVPlayBackState()
        // 因为playerManager.timeUpdate事件中已经调用了该方法
        // 我们只需要更新时间戳即可
        this.lastAVSessionUpdateTime = currentTime;
      }
    }
  }

}