import { SongItemType } from "../models/music"
import {AppStorageV2} from '@kit.ArkUI'
import { playerManager } from "../utils/AvPlayerManager"
import { GlobalMusic } from "../models/GlobalMusic"
import { it } from "@ohos/hypium"
import {songs} from "../models/music"

@ComponentV2
export struct Music {
  playState:GlobalMusic=AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=> new GlobalMusic())!
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())! //非空断言, 如果为空,则报错

  build() {
    Column() {
      Text('本地音乐')
        .fontColor('#333333')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .margin({ bottom: 15, top: 10 })
      List() {
        ForEach(songs, (item: SongItemType, index: number) => {
          ListItem() {
            Row() {
              // 图
              Stack() {
                Image(item.img.startsWith('http')?item.img:$r(item.img))
                  .width(80)
                  .border({ radius: 16 })
                  .margin({ right: 15 })
                if(this.playState.url===item.url && this.playState.isPlay){
                  Image($r('app.media.wave'))
                    .width(24)
                }
              }

              // 字
              Column() {
                Text(item.name)
                  .fontColor('#333333')
                  .width('100%')
                  .fontSize(18)
                  .fontWeight(700)
                  .margin({ bottom: 15 })
                Row() {
                  Text('VIP')
                    .fontColor('#87CEFA')
                    .border({ width: 1, color: '#87CEFA', radius: 12 })
                    .backgroundColor('#E6F3FF')
                    .padding({
                      left: 5,
                      right: 5,
                      top: 3,
                      bottom: 3
                    })
                    .margin({ right: 10 })
                  Text(item.author)
                    .fontColor('#666666')
                }
                .width('100%')
              }
              .layoutWeight(1)

              // 更多
              Image($r('app.media.ic_more'))
                .width(24)
                .fillColor('#87CEFA')
            }
            .width('100%')
            .height(90)
            .backgroundColor('#FFFFFF')
            .borderRadius(16)
            .margin({ bottom: 15 })
            .padding(10)
            .onClick(() => {
              console.debug('[ChiikaMusic]:点击了' + index)
              this.pathStack.pushPathByName('Play',null,false)
              playerManager.singPlay(item);
              this.playState.songId = index;
            })
          }
        })
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F8FF')
    .padding({ left: 15, right: 15, top: 10 })
    // 扩充组件安全区域
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}