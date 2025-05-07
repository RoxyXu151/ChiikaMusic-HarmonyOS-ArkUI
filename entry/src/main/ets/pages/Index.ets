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
  }
}