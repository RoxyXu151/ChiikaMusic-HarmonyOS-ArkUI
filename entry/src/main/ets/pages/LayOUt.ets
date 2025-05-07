import { Find } from "./Find"
import { Recommend } from "./Recommend"
import { AppStorageV2 } from "@kit.ArkUI"
import { Mine } from "./Mine"
import { MomentSquarePage } from "./Moment"

// 跳转页面入口函数
@Builder
export function LayOutBuilder() {
  LayOut()
}

@ComponentV2
struct LayOut {
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())! //非空断言, 如果为空,则报错

  tabData: TabClass[] = [
    {
      text: '首页',
      icon: $r('app.media.ic_recommend')
    },
    {
      text: '播放',
      icon: $r('app.media.ic_moment')
    },
    {
      text: '发现',
      icon: $r('app.media.ic_find')
    },
    {
      text: '我的',
      icon: $r('app.media.ic_mine')
    }
  ]
  @Local selectedTab: number = 0

  @Builder
  tabBuilder(item: TabClass, index: number) {
    Column({ space: 8 }) { // space 设置tabBar的item之间的间距
      Image(item.icon)
        .width(24)
        .height(24)
        .fillColor(this.selectedTab==index?'#87CEFA':'#666666')
      Text(item.text)
        .fontColor(this.selectedTab==index?'#87CEFA':'#666666')
        .fontSize(16)
        .fontWeight(this.selectedTab==index?FontWeight.Bold:FontWeight.Normal)
    }
    .backgroundColor(this.selectedTab==index?'#E6F3FF':'transparent')
    .borderRadius(16)
    .padding(8)
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End }) { //  设置tabBar的位置
        ForEach(this.tabData, (item: TabClass, index: number) => {
          TabContent() { // 设置tabBar的item
            if(index==0) Recommend()
            else if(index==1) Find()
            else if(index==2) MomentSquarePage()
            else if(index==3) Mine()
          }.tabBar(this.tabBuilder(item, index))
          .backgroundColor('#FFFFFF')
          .expandSafeArea()
        })
      }
      .onChange((index: number) => {
        this.selectedTab = index
      })
      .expandSafeArea()
      .backgroundColor('#F0F8FF')
    }
    .expandSafeArea()
    // .title('布局页')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}

interface TabClass {
  text: string
  icon: Resource
}
