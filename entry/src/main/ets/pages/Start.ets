// 跳转页面入口函数
@Builder
export function StartBuilder() {
  Start()
}

@Component
struct Start {

  pathStack: NavPathStack = new NavPathStack() //控制跳转的对象

  aboutToAppear(): void { // 页面进入时执行,3秒后跳转
    setTimeout(() => {
      // 添加淡出动画效果后再跳转
      animateTo({
        duration: 500,
        curve: Curve.EaseOut,
      }, () => {
        this.pathStack.replacePathByName('LayOut',null)
      })
    }, 2500)//ms，提前开始动画，总体仍保持3秒跳转
  }

  build() {
    NavDestination() {
      Stack({alignContent:Alignment.TopEnd}){
        Image($r('app.media.start'))
          .width('100%')
          .height('100%')
          .expandSafeArea()
          .transition({ type: TransitionType.Insert, opacity: 1 })
        Button('跳过')
          .backgroundColor(Color.Gray)
          .margin(20)
          .transition({ type: TransitionType.Insert, opacity: 1 })
          .onClick(() => {
            // 添加淡出动画效果
            animateTo({
              duration: 500,
              curve: Curve.EaseOut,
            }, () => {
              this.pathStack.replacePathByName('LayOut',null)
            })
          })
      }
    }
    .transition({ type: TransitionType.Insert })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}