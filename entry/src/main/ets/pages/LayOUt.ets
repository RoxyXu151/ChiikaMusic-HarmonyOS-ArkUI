import { Music } from "./Music"
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

  // tabBuilder 构建tabBar的item
  @Builder tabBuilder(item: TabClass, index: number) {
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
    .width('80%')
  }

  build() {
    NavDestination() {
      // 添加页面切换动画
      Tabs({ barPosition: BarPosition.End }) { //Tabs组件为底部tabBar组件，barPosition设置tabBar的位置,BarPosition.End表示底部
        ForEach(this.tabData, (item: TabClass, index: number) => {
          TabContent() { // 设置tabBar的item
            if(index==0) Recommend() // 首页
            else if(index==1) Music() // 播放
            else if(index==2) MomentSquarePage() // 发现
            else if(index==3) Mine() // 我的
          }.tabBar(this.tabBuilder(item, index))
          .backgroundColor('#F0F8FF')
          .border({radius: 5})
          .expandSafeArea()
          .transition({ type: TransitionType.Insert, opacity: 1 })
        })
      }
      .onChange((index: number) => {
        this.selectedTab = index
      })
      .expandSafeArea()
      .backgroundColor('#ffa5d3ef')
      .animationDuration(400) // 增加动画持续时间

    }
    .expandSafeArea()
    .title('布局页')
    .transition({
      type:TransitionType.Insert,
      opacity: 1,
      translate: { x: 0, y: 0 }
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}

interface TabClass {
  text: string
  icon: Resource
}
