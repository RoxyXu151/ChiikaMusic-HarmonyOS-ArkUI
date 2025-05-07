import { SongItemType } from "../models/music"
import { AppStorageV2 } from "@kit.ArkUI";
import { GlobalMusic } from "../models/GlobalMusic";
import { playerManager } from "../utils/AvPlayerManager";
import { Line, Lyric } from "../models/Lyric";
import http from '@ohos.net.http';

// 跳转页面入口函数
@Builder
export function PlayBuilder() {
  Play()
}

@ComponentV2
struct Play {
  @Local panelHeight: string = '0%'
  @Local panelOpacity: number = 0
  pathStack: NavPathStack = new NavPathStack();
  @Local imgOrLrc:boolean = true
  // 当前播放的歌曲
  @Local
  playState: GlobalMusic = AppStorageV2.connect(GlobalMusic, "SONG_KEY", () => new GlobalMusic())!
  
  // 歌词相关
  @Local lyric: Lyric = new Lyric()
  @Local lrcContent: string = ''
  @Local isLyricLoaded: boolean = false
  @Local currentLyric: string = ''
  @Local nextLyric: string = ''
  @Local activeLyricIndex: number = -1
  @Local scroller: Scroller = new Scroller() // 添加歌词滚动控制器



  @Builder
  deleteButton(index: number) {
    Button('删除')
      .backgroundColor('#87CEFA')
      .fontColor('#FFFFFF')
      .width(80)
      .height('100%')
      .borderRadius(12)
      .fontSize(16)
      .fontWeight(FontWeight.Medium)
      .type(ButtonType.Normal)
      .onClick(()=> {
        //删除是否是正在播放的歌曲
        if(index===this.playState.playerIndex){//是
          //当前歌单是否有多首歌
          if(this.playState.playList.length==1){//否，只有一首歌，移除所有歌曲，退回到find界面
            playerManager.player?.reset()
            this.playState.reset()
            this.playState.playerIndex=-1
          }else{//是，删除当前歌曲，直接下一首歌
            this.playState.playList.splice(index,1)//splice用法：删除数组中指定位置的元素，返回被删除的元素，参数1：删除的起始位置，参数2：删除的个数，参数3：删除的位置后的元素替换的值
            if(this.playState.playerIndex>=this.playState.playList.length) {
              this.playState.playerIndex = 0;
            }
              playerManager.singPlay(this.playState.playList[this.playState.playerIndex])
          }
        }else{//否
          //是否在当前播放歌曲前面
          if(index<this.playState.playerIndex){//是
            this.playState.playList.splice(index,1)//splice用法：删除数组中指定位置的元素，返回被删除的元素，参数1：删除的起始位置，参数2：删除的个数，参数3：删除的位置后的元素替换的值
            this.playState.playerIndex--
            playerManager.singPlay(this.playState.playList[this.playState.playerIndex])
          }else{//否
            this.playState.playList.splice(index,1)//splice用法：删除数组中指定位置的元素，返回被删除的元素，参数1：删除的起始位置，参数2：删除的个数，参数3：删除的位置后的元素替换的值
          }
        }
        //回退到前一页
        this.pathStack.pop()
      })

  }

  number2time(number: number) {
    // 毫秒 → 秒 → 分+秒; 先判断是否大于1分钟
    if (number > 60 * 1000) {
      const s = Math.floor(number / 1000 % 60)
      const m = Math.floor(number / 1000 / 60)
      const second = s.toString().padStart(2, '0')
      const minute = m.toString().padStart(2, '0')
      return minute + ':' + second
    } else {
      const s = Math.floor(number / 1000 % 60)
      const second = s.toString().padStart(2, '0')
      return '00:' + second
    }
  }

  // 唱片模式
  @Builder
  DiscMode() {
    Column(){
      // 图片
      Stack({ alignContent: Alignment.Top }) {
        Row() {
          Row() {
            Image(this.playState.img.startsWith('http')?this.playState.img:$r(this.playState.img))
              .width('70%')
              .borderRadius(400)
              .border({ width: 4, color: '#87CEFA' }) // 添加淡蓝色边框
          }
          .backgroundImage($r('app.media.ic_cd'))
          .backgroundImageSize(ImageSize.Cover)
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .borderRadius(400)
          .clip(true)
          .aspectRatio(1)
          .rotate({
            angle: this.playState.isPlay ? (new Date().getTime()) % 360 : 0,
            centerX: '50%',
            centerY: '50%'
          })
          .animation({
            duration: 50,
            tempo: 1.0,
            iterations: -1,
            curve: Curve.Linear
          })
        }
        .margin({
          top: 50
        })
        .width('90%')
        .aspectRatio(1)
        .justifyContent(FlexAlign.Center)
        .padding(24)

        // 唱针
        Image($r('app.media.ic_stylus'))
          .width(200)
          .aspectRatio(1)
          .rotate({
            angle: this.playState.isPlay ? -55 : -30,
            centerX: 100,
            centerY: 30
          })
          .animation({
            duration: 500
          })
      }
      // 歌名、作者
      Column({ space: 10 }) {
        Text(this.playState.name)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333') // 更改为深灰色
        Text(this.playState.author)
          .fontSize(20)
          .fontColor('#666666') // 更改为中灰色
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .zIndex(3)
      .layoutWeight(1)
      .borderRadius(20)

    }.layoutWeight(1)
    // 操作
    Row() {
      Badge({ value: '99+', style: { badgeSize: 12, badgeColor: '#45CCCCCC' } }) {
        Image($r("app.media.ic_like"))
          .fillColor(Color.White)
          .width(24)
      }

      Badge({ value: '10W', style: { badgeSize: 12, badgeColor: '#45cccccc' } }) {
        Image($r("app.media.ic_comment_o"))
          .fillColor(Color.White)
          .width(18)
      }

      Badge({ value: 'hot', style: { badgeSize: 12, badgeColor: '#a8ff3131' } }) {
        Image($r("app.media.ic_bells_o"))
          .fillColor(Color.White)
          .width(24)
      }

      Badge({ value: 'vip', style: { badgeSize: 12, badgeColor: '#b7efd371' } }) {
        Image($r("app.media.ic_download_o"))
          .fillColor(Color.White)
          .width(24)
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }

  // 获取歌词内容
  async fetchLyric() {
    try {
      // 使用当前播放歌曲的歌词属性
      if (this.playState.playList.length > 0 && this.playState.playerIndex >= 0) {
        const currentSong = this.playState.playList[this.playState.playerIndex];
        if (currentSong.lrc) {
          // 使用歌曲对象中的歌词
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
        this.lyric.parseLrc(this.lrcContent);
        const allLyrics = this.lyric.getAllLyrics();
        console.info(`解析后歌词行数: ${allLyrics.length}`);
        if (allLyrics.length > 0) {
          console.info(`第一行歌词: ${allLyrics[0].text}, 时间: ${allLyrics[0].time}`);
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
  
  // 上次更新AVSession状态的时间
  @Local lastAVSessionUpdateTime: number = 0;
  
  // 更新当前显示的歌词
  updateLyric() {
    if (this.isLyricLoaded && this.playState.time > 0) {
      const lyrics = this.lyric.getCurrentAndNextLyric(this.playState.time);
      this.currentLyric = lyrics[0];
      this.nextLyric = lyrics[1];
      this.activeLyricIndex = this.lyric.getCurrentIndex();
      
      // 如果有活跃的歌词行，滚动到该行，使其居中显示
      if (this.activeLyricIndex >= 0) {
        this.scroller.scrollToIndex(this.activeLyricIndex, true,ScrollAlign.CENTER);
      }
      
      // 限制AVSession状态更新频率，每2秒最多更新一次
      const currentTime = new Date().getTime();
      if (currentTime - this.lastAVSessionUpdateTime > 300) {
        // 这里不直接调用avSessionManager.setAVPlayBackState()
        // 因为playerManager.timeUpdate事件中已经调用了该方法
        // 我们只需要更新时间戳即可
        this.lastAVSessionUpdateTime = currentTime;
      }
    }
  }
  
  // 歌词模式
  @Builder
  LrcMode() {
    Column() {
      // 如果歌词未加载，显示加载提示
      if (!this.isLyricLoaded) {
        Text('歌词加载中...')
          .fontSize(20)
          .fontColor(Color.White)
          .margin({ top: 100 })
      } else if (this.lyric.getAllLyrics().length === 0) {
        // 如果歌词为空，显示提示
        Text('暂无歌词')
          .fontSize(20)
          .fontColor(Color.White)
          .margin({ top: 100 })
      } else {
        // 显示所有歌词，不管是否正在播放
        Text('全部歌词')
          .fontSize(16)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })
        
        // 歌词显示区域
        List({ space: 20, scroller: this.scroller }) {
          // 获取所有歌词行
          ForEach(this.lyric.getAllLyrics(), (item:Line, index) => {
            ListItem() {
              Text(item.text)
                .fontSize(index === this.activeLyricIndex ? 25 : 20)
                .fontWeight(index === this.activeLyricIndex ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(index === this.activeLyricIndex ? Color.White : Color.Black)
                .opacity(index === this.activeLyricIndex ? 1 : 0.6)
                .textAlign(TextAlign.Center)
                .animation({
                  duration: 300,
                  curve: Curve.EaseOut
                })
            }
          })
        }
        .width('100%')
        .height('100%')
        .listDirection(Axis.Vertical)
        .alignListItem(ListItemAlign.Center)
        .scrollBar(BarState.Auto) // 显示滚动条
        .edgeEffect(EdgeEffect.Spring)
      }
    }
    .width('100%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
    .layoutWeight(1)
  }

  aboutToAppear() {
    // 加载歌词
    this.fetchLyric();
    
    // 设置定时器，每200毫秒更新一次歌词，与AVSession状态更新频率保持一致
    setInterval(() => {
      this.updateLyric();
    }, 200);
  }
  
  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) {
        // 播放
        Stack() {
          // 变色背景
          Image(this.playState.img.startsWith('http')?this.playState.img:$r(this.playState.img))
            .width('100%')
            .height('100%')
            .blur(1000)
            .opacity(0.7) // 降低不透明度
            .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
          // 保留专辑图片虚化背景
          Column()
            .width('100%')
            .height('100%')
          // 内容
          Column() {
            // 播放界面
            Column() {
              // 图片、唱针、歌名、作者
              Column(){
                //  唱片模式
                if(this.imgOrLrc) this.DiscMode()
                // 歌词模式
                else this.LrcMode()
              }.layoutWeight(1)
              .width('100%')
              .onClick(()=>{
                this.imgOrLrc=!this.imgOrLrc
              })

              // 播放
              Column() {
                // 进度条
                Row({ space: 4 }) {
                  Text(this.number2time(this.playState.time))
                    .fontSize(14)
                    .fontColor('#333333')
                    .fontWeight(FontWeight.Medium)
                  Slider({
                    value: this.playState.time,
                    min: 0,
                    max: this.playState.duration
                  })
                    .onChange((value) => {
                      playerManager.seekPlay(value)
                    })
                    .layoutWeight(1)
                    .blockColor('#87CEFA')
                    .selectedColor('#87CEFA')
                    .trackColor('#E6F3FF')
                    .trackThickness(4)
                  Text(this.number2time(this.playState.duration))
                    .fontSize(14)
                    .fontColor('#333333')
                    .fontWeight(FontWeight.Medium)
                }
                .width('100%')
                .padding(24)
                .borderRadius(20)
                .margin({ left: 15, right: 15 })

                // 切换
                Row() {
                  Image($r('app.media.ic_'+this.playState.playMode))
                    .fillColor('#87CEFA')
                    .width(36)
                    .onClick(() => {
                      if(this.playState.playMode=='auto') this.playState.playMode='random'
                      else if(this.playState.playMode=='random') this.playState.playMode='repeat'
                      else if(this.playState.playMode=='repeat') this.playState.playMode='auto'
                    })
                  //上一首
                  Image($r("app.media.ic_prev"))
                    .fillColor('#87CEFA')
                    .width(36)
                    .onClick(()=> {
                      playerManager.prevPlay();
                    })

                  // 播放按钮
                  Image(this.playState.isPlay ? $r('app.media.ic_paused') : $r('app.media.ic_play'))
                    .fillColor('#FFD700')
                    .width(60)
                    .onClick(() => {
                      this.playState.isPlay ? playerManager.pause() : playerManager.singPlay(this.playState.playList[this.playState.playerIndex])
                    })
                  // 下一首
                  Image($r('app.media.ic_next'))
                    .fillColor('#87CEFA')
                    .width(36)
                    .onClick(() => {
                      playerManager.nextPlay()
                    })
                  // 播放列表
                  Image($r('app.media.ic_song_list'))
                    .fillColor('#87CEFA')
                    .width(36)
                    .onClick(() => {
                      this.panelHeight = '50%'
                      this.panelOpacity = 1
                    })
                }
                .width('100%')
                .padding({
                  bottom: 24
                })
                .justifyContent(FlexAlign.SpaceAround)
              }
              .width('100%')
            }
            .layoutWeight(1)
            .width('100%')
          }
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Transparent)

        // 列表
        Column() {
          Column() {

          }
          .width('100%')
          .layoutWeight(1)
          .onClick(() => {
            this.panelHeight = '0%'
            this.panelOpacity = 0
          })

          Column() {
            Row() {
              Row() {
                Image($r("app.media.ic_play"))
                  .width(24)
                  .fillColor('#87CEFA')
              }
              .width(50)
              .aspectRatio(1)
              .justifyContent(FlexAlign.Center)

              Row({ space: 8 }) {
                Text(`播放列表 (${this.playState.playList.length})`)
                  .fontColor('#333333')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
              }
              .layoutWeight(1)

              Image($r('app.media.ic_close'))
                .fillColor('#87CEFA')
                .width(28)
                .height(28)
                .margin({ right: 16 })
                .onClick(() => {
                  this.panelHeight = '0%'
                  this.panelOpacity = 0
                })
            }
            .width('100%')
            .backgroundColor('#F0F8FF')
            .padding(12)
            .border({
              width: { bottom: 1 },
              color: '#87CEFA'
            })
            .borderRadius({
              topLeft: 16,
              topRight: 16
            })

            // 播放列表
            List() {
              ForEach(this.playState.playList, (item: SongItemType, index: number) => {
                ListItem() {
                  Row() {
                    Row() {// 播放序号
                      Text((index + 1).toString())
                        .fontColor('#87CEFA')
                        .fontSize(16)
                        .fontWeight(FontWeight.Bold)
                    }
                    .width(50) // 设置宽度为50
                    .aspectRatio(1) // 设置宽高比为1
                    .justifyContent(FlexAlign.Center) //  水平居中

                    // 列表
                    Row({ space: 10 }) {
                      Column() {
                        Text(item.name)
                          .fontSize(16)
                          .fontColor('#333333')
                          .fontWeight(FontWeight.Medium)
                        Text(item.author)
                          .fontSize(14)
                          .fontColor('#666666')
                      }
                      .layoutWeight(1)
                      .alignItems(HorizontalAlign.Start)
                      .justifyContent(FlexAlign.Center)
                    }
                    .layoutWeight(1)

                    Image($r('app.media.ic_more'))
                      .width(28)
                      .height(28)
                      .margin({ right: 16 })
                      .fillColor('#87CEFA')
                  }
                  .alignItems(VerticalAlign.Center)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(12)
                  .margin({ bottom: 8, left: 8, right: 8 })
                  .padding(8)
                  .onClick(() => {
                    playerManager.singPlay(item)
                  })
                }
                .swipeAction({
                  end: this.deleteButton(index)
                })
                .border({
                  width: { bottom: 1 },
                  color: '#12ec5c87'
                })
              })
            }
            .layoutWeight(1)
            .backgroundColor('#F0F8FF')
            .padding({ left: 8, right: 8, top: 8 })

          }
          .height(400)
        }
        .height(this.panelHeight)
        // .height('100%')
        .animation({
          duration: 300
        })
        .backgroundColor('#ff353333')
        .opacity(this.panelOpacity)
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Transparent)

    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .hideTitleBar(true) // 隐藏标题栏
  }
}