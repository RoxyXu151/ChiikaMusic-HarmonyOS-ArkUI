import { media } from '@kit.MediaKit'
import { GlobalMusic } from '../models/GlobalMusic';
import { SongItemType } from '../models/music';
import { AppStorageV2 } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { print, PrintExtensionAbility } from '@kit.BasicServicesKit';
import { avSessionManager } from './AvSessionManager';
import { GlobalLyric } from '../models/Lyric';

class AvPlayerManager{

  player:media.AVPlayer|null=null;

  //共享播放数据
  currentSong:GlobalMusic=AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!
  // 歌词数据
  lyric:GlobalLyric=AppStorageV2.connect(GlobalLyric,'LYRIC_KEY',()=>new GlobalLyric())!
  //创建播放器+监听播放器状态
  async init(){
    if(!this.player){
      // 调用media.createAVPlayer()创建AVPlayer实例
      this.player=await media.createAVPlayer();
    }
    this.player.on('stateChange', (state) => {
      if(state=='initialized') this.player?.prepare() //?表示可能为空
      else if(state=='prepared'){
        this.player?.play()
        this.currentSong.isPlay=true;
      }else if(state=='completed'){
        this.nextPlay()
      }else if(state=='released'){
        this.currentSong.reset()
      }
    })

    //剩余时间变化
    this.player.on('durationUpdate',(duration)=>{
      this.currentSong.duration=duration
      avSessionManager.setAVMetadata(this.currentSong.playList[this.currentSong.playerIndex])
    })

    //当前播放时长
    this.player.on('timeUpdate',(time)=>{
      //设置播放状态
      avSessionManager.setAVPlayBackState()
      this.currentSong.time=time
    },)

  }
  //设置播放资源
  singPlay(song:SongItemType){
    //申请长时任务
    avSessionManager.startBackgroundTask();
    //设置播放状态
    avSessionManager.setAVPlayBackState()
    if(this.currentSong.playList.some((item)=>item.id==song.id)){//播放列表中存在
      if(this.currentSong.url===song.url){ //===表示值和类型都相同，==表示值相同
        this.player?.play()
      }else{
        //设置新索引
        this.currentSong.playerIndex=this.currentSong.playList.findIndex(item=>item.id===song.id)
        //切换歌曲
        this.changeSong()
      }
    }else{
      this.currentSong.playList.unshift(song) //播放列表中添加,unshift表示在数组开头添加
      this.currentSong.playerIndex=0
      //切换歌曲
      this.changeSong()
    }
    console.log('当前播放歌曲信息',this.currentSong.name)
    this.currentSong.isPlay=true
  }

  //切换歌曲
  async changeSong(){
    await this.player?.reset()
    this.currentSong.duration=0
    this.currentSong.time=0
    this.currentSong.set(this.currentSong.playList[this.currentSong.playerIndex])

    // 处理本地资源文件路径
    let url = this.currentSong.url;

    this.player!.url = url;
  }

  //跳转进度
  seekPlay(value:number){
    this.player?.seek(value)
  }

  //暂停
  pause(){
    //设置播放状态
    avSessionManager.setAVPlayBackState()
    this.player?.pause()
    this.currentSong.isPlay=false
  }

  //上一首
  prevPlay(){
    switch (this.currentSong.playMode){
      case 'auto':
        this.currentSong.playerIndex--
        if(this.currentSong.playerIndex<0){
          this.currentSong.playerIndex=this.currentSong.playList.length-1
        }
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
      case 'random':
        //随机播放
        this.currentSong.playerIndex=Math.floor(Math.random()*this.currentSong.playList.length)
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
      case 'repeat':
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
    }
    this.lyric.fetchLyric(this.currentSong) // 获取当前播放的歌曲对应歌词
  }

  //下一首
  nextPlay(){
    switch (this.currentSong.playMode){
      case 'auto':
        this.currentSong.playerIndex++
        if(this.currentSong.playerIndex>=this.currentSong.playList.length){
          this.currentSong.playerIndex=0
        }
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
      case 'random':
        //随机播放
        this.currentSong.playerIndex=Math.floor(Math.random()*this.currentSong.playList.length)
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
      case 'repeat':
        this.singPlay(this.currentSong.playList[this.currentSong.playerIndex])
        break;
    }
    this.lyric.fetchLyric(this.currentSong) // 获取当前播放的歌曲对应歌词
  }

  //释放资源
  async release(){
    await this.player?.release()
  }
}

// export const playerManager以便于其他模块使用
export const playerManager:AvPlayerManager=new AvPlayerManager()