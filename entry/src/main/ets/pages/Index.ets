import {AppStorageV2} from '@kit.ArkUI'

@Entry
@Component
struct Index {
  // pathStack: NavPathStack = new NavPathStack();
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())! //非空断言, 如果为空,则报错

  build() {
    Navigation(this.pathStack) {
    }.onAppear(() => {
      this.pathStack.pushPathByName("Start", null, false); //跳转ByName
    })
    .hideNavBar(true) //不会把自己加入到pathStack中
    .mode(NavigationMode.Stack) // 设置导航模式为堆栈模式
    .transition({
      type: TransitionType.Insert, // 设置过渡类型为滑动
      opacity: 1, // 设置不透明度
      translate: { x: 0, y: 0 } // 设置平移
    })
  }
}