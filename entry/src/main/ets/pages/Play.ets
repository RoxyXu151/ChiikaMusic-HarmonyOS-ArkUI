import { SongItemType } from "../models/music"
import { AppStorageV2, curves } from "@kit.ArkUI";
import { GlobalMusic } from "../models/GlobalMusic";
import { playerManager } from "../utils/AvPlayerManager";
import { GlobalLyric, Line} from "../models/Lyric";
import { common } from '@kit.AbilityKit';
import { GlobalHealthData } from "../models/Healthy";

// 跳转页面入口函数
@Builder
export function PlayBuilder() {
  Play()
}

@ComponentV2
struct Play {
  pathStack: NavPathStack = new NavPathStack();
  //上下文
  @Local context: common.UIAbilityContext | null = null
  // 播放模式
  @Local playMode:number=0
  // 当前播放的歌曲
  @Local playState: GlobalMusic = AppStorageV2.connect(GlobalMusic, "SONG_KEY", () => new GlobalMusic())!
  // 歌词数据
  @Local lyric:GlobalLyric=AppStorageV2.connect(GlobalLyric,'LYRIC_KEY',()=>new GlobalLyric())!
  //运动健康
  @Local healthData:GlobalHealthData=AppStorageV2.connect(GlobalHealthData,'HEALTH_KEY',()=>new GlobalHealthData())!
  //歌词列表

  @Local isShowSheet: boolean = false;


  aboutToAppear() {// 页面进入时执行
    console.debug("[ChiikaMusic]:进入Play界面")
    this.context = getContext(this) as common.UIAbilityContext;// 获取上下文，用于请求权限
    this.lyric.fetchLyric(this.playState) // 获取当前播放的歌曲对应歌词
    this.lyric.lyricUpdateTimer = setInterval(() => {// 设置定时器, 每200毫秒更新一次歌词
      this.lyric.updateLyric(this.playState);
    }, 200);
  }

  aboutToDisappear() {
    if (this.lyric.lyricUpdateTimer !== -1) {// 清理定时器，防止内存泄漏
      clearInterval(this.lyric.lyricUpdateTimer);
      this.lyric.lyricUpdateTimer = -1;
    }
    this.healthData.stopStepCounter();// 停止步数计数器
  }

  // 删除按钮
  @Builder deleteButton(index: number) {
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

  // 唱片模式
  @Builder DiscMode() {
    Column(){
      // 图片
      Stack({ alignContent: Alignment.Top }) {
        Row() {
          Row() {
            Image(this.playState.img.startsWith('http')?this.playState.img:$r(this.playState.img))
              .width(200).height(200)
              .borderRadius(400) // 添加圆形边框,直径还是半径：直径为400，半径为200
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
            angle: (this.playState.time/this.playState.duration) * 360 * 5.0, // 一首歌播完转10圈
            centerX: '50%', // 设置中心点为图片中心
            centerY: '50%' // 设置中心点为图片中心
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
            angle: this.playState.isPlay ? -40 : -60,
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

  // 歌词模式
  @Builder LrcMode() {
    Column() {
      // 如果歌词未加载，显示加载提示
      if (!this.lyric.isLyricLoaded) {
        Text('歌词加载中...')
          .fontSize(20)
          .fontColor(Color.White)
          .margin({ top: 100 })
      } else if (this.lyric.lyrics.length === 0) {
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
        List({ space: 20, scroller: this.lyric.scroller }) {
          // 获取所有歌词行
          ForEach(this.lyric.lyrics, (item:Line, index) => {
            ListItem() {
              Text(item.text)
                .fontSize(index === this.lyric.activeLyricIndex ? 25 : 20)
                .fontWeight(index === this.lyric.activeLyricIndex ? FontWeight.Bold : FontWeight.Normal)
                .fontColor(index === this.lyric.activeLyricIndex ? Color.White : Color.Black)
                .opacity(index === this.lyric.activeLyricIndex ? 1 : 0.6)
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

  // 运动模式
  @Builder RunMode() {
    Column() {
      // 顶部标题
      Text('运动模式')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .margin({ top: 20, bottom: 20 })
      
      // 步数圆环
      Stack() {
        // Progress组件 显示步数进度，value 为当前步数，total 为目标步数, ProgressType.Ring 为圆环类型
        Progress({ value: this.healthData.stepCount, total: this.healthData.stepGoal, type: ProgressType.Ring })
          .width('80%')
          .height(300)
          .color('#87CEFA')
          .backgroundColor('#333333')
          .style({ strokeWidth: 20 }) // 设置圆环的宽度
          .animation({
            duration: 1000, // 设置动画持续时间
            curve: Curve.EaseOut // 设置动画曲线
          })
        
        Column() {
          Text(this.healthData.stepCount.toString())
            .fontSize(60)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
          
          Text('步')
            .fontSize(24)
            .fontColor('#FFFFFF')
            .margin({ top: 8 })
          
          Text(`目标: ${this.healthData.stepGoal}步`)
            .fontSize(24)
            .fontColor('#ffd4e1ee')
            .margin({ top: 16 })
        }
      }
      .margin({ top: 20, bottom: 40 })
      
      // 运动数据卡片
      Row() {
        // 卡路里
        Column() {
          Text(this.healthData.calories.toString())
            .fontSize(32)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
          
          Text('卡路里')
            .fontSize(16)
            .fontColor('#87CEFA')
        }
        .backgroundColor('#333333')
        .borderRadius(16)
        .width('45%')
        .height(120)
        .justifyContent(FlexAlign.Center)
        
        // 运动时间
        Column() {
          Text(`${Math.floor(this.healthData.exerciseTime / 60)}:${(this.healthData.exerciseTime % 60).toString().padStart(2, '0')}`)
            .fontSize(32)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
          
          Text('运动时间')
            .fontSize(16)
            .fontColor('#87CEFA')
        }
        .backgroundColor('#333333')
        .borderRadius(16)
        .width('45%')
        .height(120)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      
      // 开始/停止按钮
      Button(this.healthData.isExercising ? '暂停运动' : '开始运动')
        .width('80%')
        .height(50)
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
        .backgroundColor(this.healthData.isExercising ? '#FF6347' : '#87CEFA')
        .borderRadius(25)
        .margin({ top: 20 })
        .onClick(() => {
          if (this.healthData.isExercising) {
            this.healthData.stopStepCounter()
          } else {
            this.healthData.startStepCounter()
          }
        })
        .animation({
          duration: 300
        })
    }
    .width('100%')
    .height('80%')
    .justifyContent(FlexAlign.Start)
   .layoutWeight(1)
  }

  // 播放列表
  @Builder songList(){
    // 列表
    Column() {
      Column() {
        // 标题栏
        Row() {
          //  播放按钮
          Row() {
            Image($r("app.media.ic_play"))
              .width(24)
              .fillColor('#87CEFA')
          }
          .width(50)
          .aspectRatio(1)
          .justifyContent(FlexAlign.Center)
          // 播放列表标题
          Row({ space: 8 }) {
            Text(`播放列表 (${this.playState.playList.length})`)
              .fontColor('#333333')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          }
          .layoutWeight(1)

        }
        .width('100%')
        .backgroundColor('#f1f3f5')
        .border({
          width: { bottom: 1 },
          color: Color.White
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
      }
    }
    .height('100%')
    .animation({
      duration: 300
    })
    .backgroundColor('#ff353333')
    // .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
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
                if(this.playMode==0) {
                  this.DiscMode()
                }
                // 歌词模式
                else if(this.playMode==1) {
                  this.LrcMode()
                }
                // 运动模式
                else if(this.playMode==2) {
                  this.RunMode()
                }
              }.layoutWeight(1)
              .width('100%')
              .onClick(()=>{
                // 添加播放模式切换动画
                animateTo({
                  duration: 400,
                  curve: Curve.Friction,
                }, () => {
                  this.playMode=(this.playMode+1)%3
                })
              })

              // 播放
              Column() {
                // 进度条
                Row({ space: 4 }) {
                  Text(this.playState.number2time(this.playState.time))
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
                  Text(this.playState.number2time(this.playState.duration))
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
                    .onClick(() => {this.isShowSheet = !this.isShowSheet})
                    .bindSheet($$this.isShowSheet, this.songList(), {
                      detents: [SheetSize.MEDIUM, SheetSize.LARGE, 600],
                      preferType: SheetType.BOTTOM,
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

      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Transparent)

    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .transition(TransitionEffect.translate({ y: 1000 }).animation({ curve: curves.springMotion(0.6, 0.825) }))
    .hideTitleBar(true) // 隐藏标题栏
  }
}