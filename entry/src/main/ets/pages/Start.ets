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
      this.pathStack.replacePathByName('LayOut',null)
    }, 3000)//ms
    // this.pathStack.replacePathByName('LayOut',null)
  }

  build() {
    NavDestination() {
      Stack({alignContent:Alignment.TopEnd}){
        Image($r('app.media.start'))
          .width('100%')
          .height('100%')
          .expandSafeArea()
        Button('跳过')
          .backgroundColor(Color.Gray)
          .margin(20)
          .onClick(() => {
            this.pathStack.replacePathByName('LayOut',null)
          })
      }
    }
    // .title('广告页')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}