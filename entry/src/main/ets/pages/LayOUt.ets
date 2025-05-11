import { Music } from "./Music"
import { Recommend } from "./Recommend"
import { AppStorageV2, curves } from "@kit.ArkUI"
import { Mine } from "./Mine"
import { MomentSquarePage } from "./Moment"
import componentUtils from '@ohos.arkui.componentUtils';

// 跳转页面入口函数
@Builder
export function LayOutBuilder() {
  LayOut()
}

@ComponentV2
struct LayOut {
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())! //非空断言, 如果为空,则报错
  controller: TabsController = new TabsController() // 添加TabsController用于控制Tabs
  @Local currentIndex: number = 0 // 当前选中的索引
  @Local indicatorLeftMargin: number = 0 // 导航条左边距
  @Local indicatorWidth: number = 0 // 导航条宽度
  @Local tabsWidth: number = 0 // Tabs组件宽度
  animationDuration: number = 100 // 动画持续时间

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
        .fillColor(this.selectedTab==index? '#ff2f80b1' :'#666666')
      Text(item.text)
        .fontColor(this.selectedTab==index?'#ff2f80b1':'#666666')
        .fontSize(16)
        .fontWeight(this.selectedTab==index?FontWeight.Bold:FontWeight.Normal)
        .id(index.toString()) // 添加id用于获取位置信息
    }
    .borderRadius(16)
    .padding(8)
    .width('80%')
  }

  build() {
    NavDestination() {
      Column() {
        // 添加页面切换动画
        Stack({ alignContent: Alignment.Bottom }) {
          Tabs({ barPosition: BarPosition.End, controller: this.controller }) { //Tabs组件为底部tabBar组件，barPosition设置tabBar的位置,BarPosition.End表示底部
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
            this.currentIndex = index
            // 切换时更新导航条位置和宽度
            let targetIndexInfo = this.getTextInfo(index)
            this.startAnimateTo(this.animationDuration, targetIndexInfo.left, targetIndexInfo.width)
          })
          .onAreaChange((oldValue: Area, newValue: Area) => {
            let width = Number.parseFloat(newValue.width.toString())
            this.tabsWidth = Number.isNaN(width) ? 0 : width
          })
          .backgroundColor('#ffa5d3ef')
          .animationDuration(this.animationDuration)
          .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
            // 切换动画开始时触发该回调。下划线跟着页面一起滑动，同时宽度渐变。
            this.currentIndex = targetIndex
            let targetIndexInfo = this.getTextInfo(targetIndex)
            this.startAnimateTo(this.animationDuration, targetIndexInfo.left, targetIndexInfo.width)
          })
          .onAnimationEnd((index: number, event: TabsAnimationEvent) => {
            // 切换动画结束时触发该回调。下划线动画停止。
            let currentIndicatorInfo = this.getCurrentIndicatorInfo(index, event)
            this.startAnimateTo(0, currentIndicatorInfo.left, currentIndicatorInfo.width)
          })
          .onGestureSwipe((index: number, event: TabsAnimationEvent) => {
            // 在页面跟手滑动过程中，逐帧触发该回调。
            let currentIndicatorInfo = this.getCurrentIndicatorInfo(index, event)
            this.currentIndex = currentIndicatorInfo.index
            this.indicatorLeftMargin = currentIndicatorInfo.left
            this.indicatorWidth = currentIndicatorInfo.width
          })
        }
        // 导航条
        Column()
          .width(this.indicatorWidth)
          .height(2)
          .backgroundColor('#ff2f80b1')
          .borderRadius(2)
          .position({ x: this.indicatorLeftMargin, y: 780})
          .translate({ y: -2 }) // 向上偏移，确保显示在TabBar上方
          .zIndex(2) // 确保导航条在最上层
      }
    }
    .expandSafeArea()
    .transition({
      type:TransitionType.Insert,
      opacity: 1,
      translate: { x: 0, y: 0 }
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
      // 初始化导航条位置和宽度
      setTimeout(() => {
        let initialInfo = this.getTextInfo(0)
        this.indicatorLeftMargin = initialInfo.left
        this.indicatorWidth = initialInfo.width
      }, 100)
    })
  }

  // 获取组件大小、位置、平移缩放旋转及仿射矩阵属性信息。
  private getTextInfo(index: number): Record<string, number> {
    let modePosition: componentUtils.ComponentInfo = componentUtils.getRectangleById(index.toString())
    return { 'left': px2vp(modePosition.windowOffset.x), 'width': px2vp(modePosition.size.width) }
  }

  private getCurrentIndicatorInfo(index: number, event: TabsAnimationEvent): Record<string, number> {
    let nextIndex = index
    if (index > 0 && event.currentOffset > 0) {
      nextIndex--
    } else if (index < this.tabData.length - 1 && event.currentOffset < 0) {
      nextIndex++
    }
    let indexInfo = this.getTextInfo(index)
    let nextIndexInfo = this.getTextInfo(nextIndex)
    let swipeRatio = Math.abs(event.currentOffset / this.tabsWidth)
    // 页面滑动超过一半，tabBar切换到下一页。
    let currentIndex = swipeRatio > 0.5 ? nextIndex : index
    let currentLeft = indexInfo.left + (nextIndexInfo.left - indexInfo.left) * swipeRatio
    let currentWidth = indexInfo.width + (nextIndexInfo.width - indexInfo.width) * swipeRatio
    return { 'index': currentIndex, 'left': currentLeft, 'width': currentWidth }
  }

  private startAnimateTo(duration: number, leftMargin: number, width: number) {
    animateTo({
      // 动画时长
      duration: duration,
      // 动画曲线
      curve: curves.springMotion(0.5, 0.5),
      // 播放次数
      iterations: 1,
      // 动画模式
      playMode: PlayMode.Normal,
      onFinish: () => {
        console.info('play end')
      }
    }, () => {
      this.indicatorLeftMargin = leftMargin
      this.indicatorWidth = width
    })
  }
}

interface TabClass {
  text: string
  icon: Resource
}
