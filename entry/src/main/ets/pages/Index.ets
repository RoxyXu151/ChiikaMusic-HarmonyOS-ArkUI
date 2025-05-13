import {AppStorageV2} from '@kit.ArkUI'

@Entry//入口组件, 用于启动应用, 只能有一个
@Component//组件, 用于构建UI
struct Index {
  // 定义导航路径栈
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',()=> new NavPathStack())! //非空断言, 如果为空,则报错

  build() {
    //Navigation组件: 导航组件, 用于管理页面之间的导航
    Navigation(this.pathStack) {
    }.onAppear(() => {
      // 监听页面出现事件, 并执行回调函数
      this.pathStack.pushPathByName("Start", null, false); //跳转ByName
    })
    .hideNavBar(true) //不会把自己加入到pathStack中
    // 设置导航模式为堆栈模式, 即页面之间的切换会被记录在栈中, 可以通过返回按钮返回上一个页面, 也可以通过调用popPath()方法来返回上一个页面
    .mode(NavigationMode.Stack)
    .transition({
      type: TransitionType.Insert, // 设置过渡类型为滑动
      opacity: 1, // 设置不透明度
      translate: { x: 0, y: 0 } // 设置平移
    })
  }
}