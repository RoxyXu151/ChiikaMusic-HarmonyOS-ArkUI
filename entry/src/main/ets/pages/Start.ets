import { AppStorageV2 } from "@kit.ArkUI"

// 跳转页面入口函数
@Builder
export function StartBuilder() {
  Start()
}

@Component
struct Start {
  // 控制跳转的对象
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())!

 // 页面进入时执行
  aboutToAppear(): void {
    setTimeout(() => {
      // 添加淡出动画效果后再跳转
      animateTo({
        duration: 500,
        curve: Curve.EaseOut,
      }, () => {
        this.pathStack.replacePathByName('LayOut',null) // replacePathByName用于替换当前页面
      })
    }, 2500)//ms，提前开始动画，总体仍保持3秒跳转
  }

  build() {
    // NavDestination组件: 导航目的地组件, 用于定义导航目的地的页面
    NavDestination() {
      Stack({alignContent:Alignment.TopEnd}){
        Image($r('app.media.start')) //图片组件
          .width('100%')
          .height('100%')
          .expandSafeArea()
          .transition({ type: TransitionType.Insert, opacity: 1 }) 
        Button('跳过') //按钮组件
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
  }
}