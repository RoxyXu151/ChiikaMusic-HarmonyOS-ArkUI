# ChiikaMusic 应用说明文档

## 1. 应用概述
ChiikaMusic 是一款基于 ArkUI 框架开发的现代化音乐播放应用，支持本地音乐播放、歌词同步滚动、播放列表管理、健康数据集成等功能，致力于为用户提供流畅、直观的音乐体验。

## 2. 功能结构
### 2.1 主要页面与功能
| 页面名称   | 主要功能描述                                   |
|------------|----------------------------------------------|
| Index      | 应用入口，初始化与导航栈管理                  |
| Start      | 启动页，展示启动动画，2.5秒后自动跳转主界面    |
| LayOut     | 主布局，底部标签栏切换各主页面                |
| Music      | 本地音乐列表，支持点击播放、添加到播放列表     |
| Play       | 播放详情，展示歌曲信息、进度、歌词、模式切换   |
| Recommend  | 推荐音乐与歌单，音乐发现                      |
| Mine       | 个人中心，收藏、历史记录                      |
| Moment     | 动态广场，音乐社区内容                        |

### 2.2 核心功能
- 音乐播放（播放/暂停、切歌、进度控制、播放模式）
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195229113.png" alt="image-20250513195229113" style="zoom:25%;" />
- 歌词同步滚动显示
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195255790.png" alt="image-20250513195255790" style="zoom:25%;" />
- 播放列表管理
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195322894.png" alt="image-20250513195322894" style="zoom:25%;" />
- 本地音乐浏览与播放
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195338337.png" alt="image-20250513195338337" style="zoom:25%;" /><img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195703007.png" alt="image-20250513195703007" style="zoom:25%;" />
- 推荐与发现
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195350127.png" alt="image-20250513195350127" style="zoom:25%;" /><img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195640157.png" alt="image-20250513195640157" style="zoom:25%;" />
- 个人信息与历史
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195401177.png" alt="image-20250513195401177" style="zoom:25%;" />
- 健康数据集成（步数等）
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195615966.png" alt="image-20250513195615966" style="zoom:25%;" /><img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195458759.png" alt="image-20250513195458759" style="zoom:25%;" />
- 后台播放支持
  <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195515059.png" alt="image-20250513195515059" style="zoom:25%;" /><img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513195533103.png" alt="image-20250513195533103" style="zoom:25%;" />

### 2.3 页面跳转逻辑
#### 导航栈管理

1. 在@Entry修饰的Index页面，创建Navigation组件并传入NavPathStack实例对象，设置导航模式为堆栈模式并把自己排除在堆栈外，然后进入start页面即开屏页面

   ~~~javascript
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
   ~~~

2. start页面使用NavDestination，显示3秒钟后，将堆栈中的start页面替换为layout

   ~~~javascript
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
   ~~~

3. layout页面同样使用NavDestination，并在其中进行标签页布局，使用Tabs组件进行后续的页面切换，TabContent用于内容切换，tabBar用于切换按键的摆放

   ~~~javascript
   Stack({ alignContent: Alignment.Bottom }) {
             Tabs({ barPosition: BarPosition.End, controller: this.controller }) { //Tabs组件为底部tabBar组件，barPosition设置tabBar的位置,BarPosition.End表示底部
               ForEach(this.tabData, (item: TabClass, index: number) => {
                 TabContent() { // 设置tabBar的item
                   if(index==0) Recommend() // 首页
                   else if(index==1) Music() // 音乐
                   else if(index==2) MomentSquarePage() // 发现
                   else if(index==3) Mine() // 我的
                 }.tabBar(this.tabBuilder(item, index))
                 .backgroundColor('#F0F8FF')
                 .border({radius: 5})
                 .expandSafeArea()
                 .transition({ type: TransitionType.Insert, opacity: 1 })
               })
             }
       }
   ~~~

4. 在音乐页面Music中，新建一个NavPathStack用于存储后续音乐的播放界面，点击一首歌就play页面加入栈中

   ~~~javascript
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
   ~~~

5. 在play页面中使用NavDestination，其次，为了同时展示唱片模式、歌词模式、运动模式三种形态，我创建了三个@Builder修饰的组件并设置了playMode属性用于切换模式
   <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513201850549.png" alt="image-20250513201850549" style="zoom:25%;" />
   <img src="../../AppData/Roaming/Typora/typora-user-images/image-20250513202015905.png" alt="image-20250513202015905" style="zoom:25%;" />

#### 主要跳转流程
```mermaid
graph TD
    A[应用启动] --> B[Index]
    B -->|pushPathByName| C[Start]
    C -->|2.5秒后/跳过| D[LayOut]
    D -->|Tabs| E{底部标签栏}
    E -->|首页| F[Recommend]
    E -->|播放| G[Play]
    E -->|发现| H[Moment]
    E -->|我的| I[Mine]
```

**解释**：
- **应用启动**：应用启动后首先进入 `Index` 页面，负责初始化和导航栈管理。
- **Start**：通过 `pushPathByName` 方法进入 `Start` 页面，展示启动动画，2.5秒后自动跳转至主界面 `LayOut`。
- **LayOut**：主布局页面，包含底部标签栏用于切换各个主页面。
- **Tabs**：底部标签栏提供四个选项：`首页`、`播放`、`发现`、`我的`，分别对应 `Recommend`、`Play`、`Moment` 和 `Mine` 页面。

#### 音乐播放与歌词同步流程
```mermaid
sequenceDiagram
    用户->>音乐列表: 点击歌曲
    音乐列表->>播放器: singPlay(song)
    播放器->>全局状态: 更新播放信息
    播放器->>自身: 播放音乐
    全局状态-->>播放页: 状态变更通知
    播放页->>歌词管理: fetchLyric()
    歌词管理-->>播放页: 返回歌词
    播放页->>自身: 更新UI与歌词
```

**解释**：
- **用户点击歌曲**：用户在音乐列表中选择一首歌曲。
- **播放器播放音乐**：音乐列表调用 `singPlay(song)` 方法，播放器开始播放音乐并更新全局状态。
- **状态变更通知**：全局状态更新后通知播放页，播放页请求歌词管理模块获取歌词。
- **更新UI与歌词**：播放页接收到歌词后更新界面显示和歌词同步。

#### 播放列表管理逻辑
```mermaid
flowchart TD
    A[用户操作] --> B{删除歌曲}
    B -->|当前播放| C{仅剩一首}
    C -->|是| D[重置播放器]
    C -->|否| E[删除并播放下一首]
    B -->|非当前播放| F{在当前前面?}
    F -->|是| G[删除并更新索引]
    F -->|否| H[直接删除]
```

**解释**：
- **删除歌曲**：用户选择删除歌曲。
- **当前播放歌曲**：判断删除的是否为当前播放的歌曲。
- **仅剩一首**：如果是当前播放且仅剩一首，重置播放器；否则删除并播放下一首。
- **非当前播放歌曲**：判断删除的歌曲是否在当前播放歌曲之前，若是则更新索引，否则直接删除。

## 3. 技术架构与实现
### 3.1 技术选型
- **ArkUI**：声明式 UI 框架，组件化开发
- **AppStorageV2**：全局数据共享与状态管理
- **media.AVPlayer**：音频播放核心


#### 3.2.2 音乐播放与歌词同步流程
```mermaid
sequenceDiagram
    用户->>音乐列表: 点击歌曲
    音乐列表->>播放器: singPlay(song)
    播放器->>全局状态: 更新播放信息
    播放器->>自身: 播放音乐
    全局状态-->>播放页: 状态变更通知
    播放页->>歌词管理: fetchLyric()
    歌词管理-->>播放页: 返回歌词
    播放页->>自身: 更新UI与歌词
```

#### 3.2.3 播放列表管理逻辑
```mermaid
flowchart TD
    A[用户操作] --> B{删除歌曲}
    B -->|当前播放| C{仅剩一首}
    C -->|是| D[重置播放器]
    C -->|否| E[删除并播放下一首]
    B -->|非当前播放| F{在当前前面?}
    F -->|是| G[删除并更新索引]
    F -->|否| H[直接删除]
```

### 3.3 歌词同步滚动机制
#### 3.3.1 数据结构与解析
- 歌词行结构

  ~~~javascript
  export interface Line {
    time: number;
    text: string;
  }
  ~~~

- 获取歌词内容与歌词解析：首先根据当前播放的歌曲索引获取歌曲对应的歌词文本内容，接着按照回车符号分割歌词为lines，使用正则表达式提取时间戳，作者，编曲等信息，然后根据时间戳文本获取对应的时分秒等准确时间信息并将line按照时间排序方便后续进行歌词的滚动

  ~~~javascript
  async fetchLyric(playState:GlobalMusic) {
      try {
        // 获取歌词内容
        if (playState.playList.length > 0 && playState.playerIndex >= 0) {
          const currentSong = playState.playList[playState.playerIndex];
          if (currentSong.lrc) { // 使用歌曲对象中的歌词
            this.lrcContent = currentSong.lrc;
            console.info(`使用歌曲[${currentSong.name}]的内置歌词，长度: ${this.lrcContent.length}`);
          } else {
            // 如果当前歌曲没有歌词属性，使用默认提示
            this.lrcContent = '';
            console.info(`歌曲[${currentSong.name}]没有内置歌词`);
          }
        } else {
          console.info('没有正在播放的歌曲');
          this.lrcContent = '';
        }
  
        // 解析歌词
        if (this.lrcContent) {
          this.parseLrc(this.lrcContent);
          console.info(`解析后歌词行数: ${this.lyrics.length}`);
          if (this.lyrics.length > 0) {
            console.info(`第一行歌词: ${this.lyrics[0].text}, 时间: ${this.lyrics[0].time}`);
          }
          this.isLyricLoaded = true;
          console.info('歌词加载成功');
        } else {
          this.isLyricLoaded = true; // 标记为已加载，但没有歌词内容
          console.info('没有可用的歌词');
        }
      } catch (error) {
        console.error(`获取歌词异常: ${error instanceof Error ? error.message : String(error)}`);
      }
    }
  ~~~

- 支持标准 LRC 格式，正则提取时间戳与文本，转换为毫秒并排序

#### 3.3.2 同步与滚动实现
- 设置一个定时器，每 200ms 检查播放进度，查找当前歌词行并进行歌词的更新

  ~~~javascript
    aboutToAppear() {// 页面进入时执行
      console.debug("[ChiikaMusic]:进入Play界面")
      this.context = getContext(this) as common.UIAbilityContext;// 获取上下文，用于请求权限
      this.lyric.fetchLyric(this.playState) // 获取当前播放的歌曲对应歌词
      this.lyric.lyricUpdateTimer = setInterval(() => {// 设置定时器, 每200毫秒更新一次歌词
        this.lyric.updateLyric(this.playState);
      }, 200);
    }
  ~~~

- 歌词更新逻辑，获取当前播放状态的时间，然后根据时间戳找到当前播放的歌词和下一句应该播放的歌词，并将当前播放的歌词滚动到居中位置并高亮放大显示然后更新时间戳

  ~~~javascript
    // 更新当前显示的歌词
    updateLyric(playState:GlobalMusic) {
      if (this.isLyricLoaded && playState.time > 0) {
        const lyrics = this.getCurrentAndNextLyric(playState.time);
        this.currentLyric = lyrics[0];
        this.nextLyric = lyrics[1];
        this.activeLyricIndex = this.getCurrentIndex();
  
        // 如果有活跃的歌词行，滚动到该行，使其居中显示
        if (this.activeLyricIndex >= 0) {
          this.scroller.scrollToIndex(this.activeLyricIndex, true,ScrollAlign.CENTER);
        }
  
        // 限制AVSession状态更新频率，每2秒最多更新一次
        const currentTime = new Date().getTime();
        if (currentTime - this.lastAVSessionUpdateTime > 200) {
          // 这里不直接调用avSessionManager.setAVPlayBackState()
          // 因为playerManager.timeUpdate事件中已经调用了该方法
          // 我们只需要更新时间戳即可
          this.lastAVSessionUpdateTime = currentTime;
        }
      }
    }
  ~~~

- 歌词同步滚动机制流程图

  ```mermaid
  flowchart TD
    A[Play页面加载] --> B[调用fetchLyric获取歌词]
    B --> C[启动lyricUpdateTimer定时器]
    C --> D[每200ms调用updateLyric]
    D --> E{歌词是否已加载?}
    E -- 否 --> D
    E -- 是 --> F{播放时间>0?}
    F -- 否 --> D
    F -- 是 --> G[获取当前时间对应的歌词]
    G --> H[更新currentLyric和nextLyric]
    H --> I[更新activeLyricIndex]
    I --> J{activeLyricIndex >= 0?}
    J -- 是 --> K[滚动到当前歌词行并居中显示]
    J -- 否 --> L[检查AVSession更新时间]
    K --> L
    L --> M{是否需要更新AVSession?}
    M -- 是 --> N[更新lastAVSessionUpdateTime]
    M -- 否 --> D
    N --> D
    O[页面离开] --> P[清除lyricUpdateTimer]
  ```

#### 3.3.3 性能优化
- 页面离开时清理定时器，防止内存泄漏

  ~~~javascript
    aboutToDisappear() {
      if (this.lyric.lyricUpdateTimer !== -1) {// 清理定时器，防止内存泄漏
        clearInterval(this.lyric.lyricUpdateTimer);
        this.lyric.lyricUpdateTimer = -1;
      }
      this.healthData.stopStepCounter();// 停止步数计数器
    }
  ~~~

- 状态更新频率限制，避免频繁刷新

### 3.4 音频播放管理

#### 3.4.1 AvPlayerManager类的封装设计

1. init()函数实现了播放器的创建与播放器状态监听：首先调用media.createAVPlayer()创建AVPlayer实例，然后监听AVPlayer状态的改变并生成对应的事件，例如处于prepared下一步进行歌曲的播放，处于`completed`则切换到下一首歌曲，处于`released`则重置当前歌曲

   ~~~javascript
     async init(){
       if(!this.player){
         // 调用media.createAVPlayer()创建AVPlayer实例
         this.player=await media.createAVPlayer();
       }
       this.player.on('stateChange', (state) => {
         if(state=='initialized') this.player?.prepare() //?表示可能为空
         else if(state=='prepared'){
           this.player?.play()
           this.currentSong.isPlay=true;
         }else if(state=='completed'){
           this.nextPlay()
         }else if(state=='released'){
           this.currentSong.reset()
         }
       })
   
       //剩余时间变化
       this.player.on('durationUpdate',(duration)=>{
         this.currentSong.duration=duration
         avSessionManager.setAVMetadata(this.currentSong.playList[this.currentSong.playerIndex])
       })
   
       //当前播放时长
       this.player.on('timeUpdate',(time)=>{
         //设置播放状态
         avSessionManager.setAVPlayBackState()
         this.currentSong.time=time
       },)
   
     }
   ~~~

2. `singPlay` 函数说明

   `singPlay(song: SongItemType)` 函数用于设置播放资源并开始播放指定的歌曲。它通过管理播放列表和播放器状态来实现音乐播放的逻辑。

   - **申请长时任务**：调用 `avSessionManager.startBackgroundTask()` 方法，确保播放任务在后台持续运行。
   - **设置播放状态**：调用 `avSessionManager.setAVPlayBackState()` 方法，更新当前播放状态。
   - **播放列表检查**：检查指定的歌曲是否已存在于播放列表中。
     - 如果存在且当前播放的 URL 与指定歌曲的 URL 相同，则直接调用 `this.player?.play()` 播放。
     - 如果 URL 不同，则更新 `playerIndex` 为指定歌曲的索引，并调用 `changeSong()` 切换歌曲。
   - **添加新歌曲**：如果指定歌曲不在播放列表中，将其添加到播放列表的开头，并设置 `playerIndex` 为 0，然后调用 `changeSong()` 切换歌曲。
   - **日志输出**：使用 `console.log` 输出当前播放歌曲的信息。
   - **更新播放状态**：设置 `this.currentSong.isPlay` 为 `true`，表示当前正在播放。

   ```typescript
   singPlay(song: SongItemType) {
     avSessionManager.startBackgroundTask();
     avSessionManager.setAVPlayBackState();
     if (this.currentSong.playList.some((item) => item.id == song.id)) {
       if (this.currentSong.url === song.url) {
         this.player?.play();
       } else {
         this.currentSong.playerIndex = this.currentSong.playList.findIndex(item => item.id === song.id);
         this.changeSong();
       }
     } else {
       this.currentSong.playList.unshift(song);
       this.currentSong.playerIndex = 0;
       this.changeSong();
     }
     console.log('当前播放歌曲信息', this.currentSong.name);
     this.currentSong.isPlay = true;
   }
   ```

#### 3.4.2 数据模型设计

##### GlobalMusic 类

`GlobalMusic` 类是应用中的核心数据模型，用于管理当前播放的音乐信息和播放状态。它通过 `@ObservedV2` 装饰器实现响应式数据绑定，确保UI与数据的同步更新。

```typescript
@ObservedV2
export class GlobalMusic {
  @Trace img: string = ""  // 音乐封面
  @Trace name: string = ""  // 音乐名称
  @Trace author: string = ""  // 作者
  @Trace url: string = ""  // 当前播放链接
  @Trace time: number = 0  // 播放时间
  @Trace duration: number = 0  // 音乐的播放时长
  @Trace songId: number = -1  // 歌曲ID

  @Trace playerIndex: number = 0  // 当前播放索引
  @Trace playList: SongItemType[] = songs  // 播放列表

  @Trace isPlay: boolean = false  // 是否播放
  @Trace playMode: 'auto'|'random'|'repeat' = 'auto'  // 播放模式
  
  // 设置歌曲信息
  set(song: SongItemType) { ... }
  
  // 重置所有属性
  reset() { ... }
  
  // 毫秒转时分秒格式
  number2time(number: number): string { ... }
}
```

主要功能：
- 存储当前播放歌曲的基本信息（封面、名称、作者、URL等）
- 管理播放状态（播放/暂停、当前时间、总时长）
- 维护播放列表和当前播放索引
- 控制播放模式（顺序播放、随机播放、单曲循环）
- 提供时间格式转换工具方法

##### SongItemType 接口

`SongItemType` 接口定义了歌曲的基本数据结构，是播放列表中每首歌曲的数据模型。

```typescript
export interface SongItemType {
  img: string    // 歌曲封面图片
  name: string   // 歌曲名称
  author: string // 歌曲作者/演唱者
  url: string    // 歌曲音频文件URL
  id: string     // 歌曲唯一标识符
  lrc?: string   // 歌词内容（可选）
}
```

##### GlobalLyric 类

`GlobalLyric` 类负责歌词的解析、存储和管理，支持LRC格式歌词的时间轴同步。

```typescript
@ObservedV2
export class GlobalLyric {
  // 歌词元数据
  @Trace private title: string = '';    // 歌曲标题
  @Trace private artist: string = '';   // 艺术家
  @Trace private album: string = '';    // 专辑
  @Trace private by: string = '';       // 歌词制作者
  @Trace lrcContent: string = ''        // 原始歌词内容
  @Trace isLyricLoaded: boolean = false // 歌词是否已加载
  @Trace currentLyric: string = ''      // 当前显示的歌词
  @Trace nextLyric: string = ''         // 下一句歌词
  @Trace activeLyricIndex: number = -1  // 当前活跃歌词索引
  @Trace scroller: Scroller = new Scroller() // 歌词滚动控制器
  @Trace lastAVSessionUpdateTime: number = 0 // 上次更新AVSession状态的时间
  @Trace lyricUpdateTimer: number = -1  // 歌词更新定时器
  @Trace lyrics: Array<Line> = [];      // 解析后的歌词数组
  @Trace private currentIndex: number = -1; // 当前显示的歌词索引
  
  // 解析LRC格式歌词
  parseLrc(lrcContent: string): void { ... }
  
  // 从文件加载歌词
  async loadFromFile(filePath: string): Promise<void> { ... }
  
  // 根据时间获取当前歌词
  getLyricByTime(currentTime: number): string { ... }
  
  // 获取当前和下一句歌词
  getCurrentAndNextLyric(currentTime: number): string[] { ... }
}
```

##### Line 接口

`Line` 接口定义了歌词行的数据结构，包含时间戳和对应的歌词文本。

```typescript
export interface Line {
  time: number;  // 时间戳（毫秒）
  text: string;  // 歌词文本
}
```

##### GlobalHealthData 类

`GlobalHealthData` 类管理用户的健康数据，包括步数、卡路里消耗和运动时间等信息。

```typescript
@ObservedV2
export class GlobalHealthData {
  @Trace initCount: number = -1        // 初始步数计数
  @Trace stepCount: number = 0         // 当前步数
  @Trace calories: number = 0          // 消耗的卡路里
  @Trace exerciseTime: number = 0      // 运动时间（秒）
  @Trace stepGoal: number = 10000      // 每日步数目标
  @Trace isExercising: boolean = false // 是否正在运动
  @Trace stepUpdateTimer: number = -1  // 步数更新定时器
  
  // 启动步数计数器
  async startStepCounter() { ... }
  
  // 停止步数计数器
  stopStepCounter() { ... }
}
```

##### AvSessionManager 类

`AvSessionManager` 类负责管理音频会话和后台任务，确保应用在后台运行时仍能继续播放音乐。

```typescript
class AvSessionManager {
  session: avSession.AVSession | null = null  // 音频会话
  playState: GlobalMusic = AppStorageV2.connect(GlobalMusic, 'SONG_KEY', () => new GlobalMusic())!
  
  // 初始化音频会话
  async init(content: Context) { ... }
  
  // 申请长时任务
  async startBackgroundTask() { ... }
  
  // 设置元数据（歌曲信息）
  setAVMetadata(song: SongItemType) { ... }
  
  // 设置播放状态
  setAVPlayBackState() { ... }
  
  // 注册事件监听
  registerEvent() { ... }
}
```

3. `async changeSong()` 函数用于切换当前播放的歌曲。

   - **重置播放器**：调用 `this.player?.reset()` 重置播放器状态。
   - **重置歌曲信息**：将 `currentSong` 的 `duration` 和 `time` 重置为 0，并设置为当前播放列表中的歌曲。
   - **设置播放资源**：将播放器的 URL 设置为当前歌曲的 URL。

4. `seekPlay(value: number)` 函数用于跳转到指定的播放进度。

   - **跳转进度**：调用 `this.player?.seek(value)` 方法，将播放进度跳转到指定的时间点。

5. `pause()` 函数用于暂停当前播放的歌曲。

   - **设置播放状态**：调用 `avSessionManager.setAVPlayBackState()` 更新播放状态。
   - **暂停播放**：调用 `this.player?.pause()` 暂停播放，并将 `isPlay` 设置为 `false`。

6. `prevPlay()` 函数用于播放上一首歌曲。

   - **播放模式判断**：根据 `playMode` 的不同，选择不同的上一首歌曲逻辑。
     - **自动模式**：递减 `playerIndex`，若小于 0，则循环到播放列表的最后一首。
     - **随机模式**：随机选择播放列表中的一首歌曲。
     - **重复模式**：重复播放当前歌曲。
   - **更新歌词**：调用 `this.lyric.fetchLyric(this.currentSong)` 获取当前播放歌曲的歌词。

7. `nextPlay()` 函数用于播放下一首歌曲。

   - **播放模式判断**：根据 `playMode` 的不同，选择不同的下一首歌曲逻辑。
     - **自动模式**：递增 `playerIndex`，若大于等于播放列表长度，则循环到播放列表的第一首。
     - **随机模式**：随机选择播放列表中的一首歌曲。
     - **重复模式**：重复播放当前歌曲。
   - **更新歌词**：调用 `this.lyric.fetchLyric(this.currentSong)` 获取当前播放歌曲的歌词。

8. `async release()` 函数用于释放播放器资源。

#### 3.4.2 AvSessionManager 类实现后台播放

​		`AvSessionManager` 类是 ChiikaMusic 应用中负责管理音频会话的核心组件，它实现了音乐播放的后台运行、媒体控制、通知栏交互等功能。该类通过 HarmonyOS 的 `AVSessionKit` 提供的 API 与系统媒体控制框架进行交互，使应用能够响应系统级的媒体控制事件（如通知栏控制、耳机按键控制等）。

1. 类属性

   ~~~typescript
   session: avSession.AVSession | null = null
   playState: GlobalMusic = AppStorageV2.connect(GlobalMusic, 'SONG_KEY', () => new GlobalMusic())!
   ~~~

   - **session**: 音频会话对象，用于与系统媒体控制框架交互

   - **playState**: 全局音乐状态对象，通过 `AppStorageV2.connect` 连接到全局状态，实现跨组件的状态共享

2. 主要方法

   1. 初始化方法

      ~~~typescript
      async init(content: Context) {
        this.session = await avSession.createAVSession(content, 'bgPlay', 'audio')
        this.registerEvent()
      }
      - 创建音频会话实例，需要三个参数：
        1. 上下文（Context）
        2. 自定义会话名称（'bgPlay'）
        3. 会话类型（'audio'）
      - 创建完成后调用 `registerEvent()` 注册媒体控制事件监听
      ~~~

   2. 后台任务管理: 申请长时任务，使音乐播放能够在后台继续运行

      - 配置 `wantAgentInfo` 对象，定义点击通知后的行为：
        - `wants`: 指定要启动的应用和能力
        - `actionType`: 设置操作类型为启动能力
        - `requestCode`: 自定义请求码
        - `actionFlags`: 设置动作执行属性

      - 通过 `backgroundTaskManager.startBackgroundRunning` 启动后台任务，指定模式为音频播放（`AUDIO_PLAYBACK`）

   ~~~typescript
   async startBackgroundTask() {
     let wantAgentInfo: wantAgent.WantAgentInfo = {
       wants: [
         {
           bundleName: "com.example.myapplication",
           abilityName: "EntryAbility"
         }
       ],
       actionType: wantAgent.OperationType.START_ABILITY,
       requestCode: 0,
       actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
     };
     const want = await wantAgent.getWantAgent(wantAgentInfo)
     backgroundTaskManager.startBackgroundRunning(getContext(), backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK,
       want)
   }
   ~~~

3. 元数据设置

   - 设置当前播放歌曲的元数据，用于在通知栏和锁屏界面显示

   - 包含的信息：

     - `assetId`: 歌曲ID
     - `title`: 歌曲名称
     - `artist`: 歌手名称
     - `duration`: 歌曲时长
     - `mediaImage`: 歌曲封面图片，根据图片URL格式进行处理
       - 如果以 'http' 开头，直接使用原URL
       - 否则构造一个OSS存储的URL路径

     ~~~typescript
     setAVMetadata(song: SongItemType) {
       this.session?.setAVMetadata({
         assetId: song.id,
         title: song.name,
         artist: song.author,
         // album: song.album,
         duration: this.playState.duration,
         mediaImage: song.img.startsWith('http') ? song.img : 'https://hm-music.oss-cn-beijing.aliyuncs.com/image/song' + song.id.substring(3, 4) + '.jpg'
       })
     }
     ~~~

4. 播放状态设置

   - 更新音频会话的播放状态，用于系统媒体控制框架同步状态
   - 设置的状态信息：
     - `state`: 播放状态（播放中或暂停中），根据 `isPlay` 属性动态设置
     - `speed`: 播放速度，默认为1.0（正常速度）
     - `position`: 播放位置信息
       - `elapsedTime`: 已播放时间
       - `updateTime`: 状态更新时间戳
     - `duration`: 歌曲总时长

   ~~~typescript
   setAVPlayBackState() {
     this.session?.setAVPlaybackState({
       state: this.playState.isPlay ? avSession.PlaybackState.PLAYBACK_STATE_PLAY : avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
       speed: 1.0,
       position: {
         elapsedTime: this.playState.time,
         updateTime: new Date().getTime()
       },
       duration: this.playState.duration
     })
   }
   ~~~

5. 事件注册

   1. 注册音频会话的各种控制事件监听，实现系统媒体控制与应用播放器的交互
   2. 监听的事件包括：
      - `play`: 播放事件，调用 `playerManager.singPlay` 播放当前索引的歌曲
      - `pause`: 暂停事件，调用 `playerManager.pause` 暂停播放
      - `playPrevious`: 上一首事件，调用 `playerManager.prevPlay` 播放上一首
      - `playNext`: 下一首事件，调用 `playerManager.nextPlay` 播放下一首
      - `seek`: 进度调整事件，调用 `playerManager.seekPlay` 跳转到指定位置
   3. 最后调用 `activate()` 激活会话，使其能够接收系统事件

   ~~~typescript
   registerEvent() {
     this.session?.on('play', () => {
       playerManager.singPlay(this.playState.playList[this.playState.playerIndex])
     })
     this.session?.on('pause', () => {
       playerManager.pause()
     })
     this.session?.on('playPrevious', () => {
       playerManager.prevPlay()
     })
     this.session?.on('playNext', () => {
       playerManager.nextPlay()
     })
     this.session?.on('seek', (position) => {
       playerManager.seekPlay(position)
     })
     this.session?.activate()
   }
   ~~~

6. 资源释放

   1. 销毁音频会话，释放相关资源
   2. 在应用退出或不再需要媒体控制时调用

   ~~~type
   async destroy() {
     await this.session?.destroy()
   }
   ~~~



### 3.5 动画设计

#### 3.5.1 LayOut界面中的自定义导航条动画

​		LayOut界面中实现了一个自定义的底部导航条动画，该动画在用户切换底部标签页时，会平滑地移动一个指示器（下划线）到当前选中的标签下方。这种动画不仅提升了用户体验，还增强了界面的交互感和现代感。

**核心实现原理**

导航条动画的核心是通过以下几个关键技术点实现的：

1. **位置和尺寸计算**：通过`componentUtils.getRectangleById`获取标签文本的位置和尺寸信息
2. **动画过渡**：使用`animateTo`函数实现平滑过渡效果
3. **事件监听**：监听Tabs组件的各种事件（切换、滑动等）来触发动画
4. **状态管理**：使用`@Local`装饰器管理导航条的位置和宽度状态

**自定义导航条动画流程图**

```mermaid
flowchart TD
  A[初始化导航条] --> B[设置初始位置和宽度]
  B --> C[监听Tabs组件事件]
  
  C --> D1[onChange事件]
  C --> D2[onAnimationStart事件]
  C --> D3[onAnimationEnd事件]
  C --> D4[onGestureSwipe事件]
  
  D1 --> E1[获取目标标签位置信息]
  D1 --> F1[调用startAnimateTo执行动画]
  
  D2 --> E2[获取目标标签位置信息]
  D2 --> F2[调用startAnimateTo执行动画]
  
  D3 --> E3[获取当前指示器信息]
  D3 --> F3[调用startAnimateTo执行动画]
  
  D4 --> E4[获取当前指示器信息]
  D4 --> F4[直接更新指示器位置和宽度]
  
  subgraph 位置计算函数
  G[getTextInfo] --> H[获取组件矩形信息]
  H --> I[返回位置和宽度]
  
  J[getCurrentIndicatorInfo] --> K[计算滑动比例]
  K --> L[计算当前位置和宽度]
  L --> M[返回索引、位置和宽度]
  end
  
  subgraph 动画执行函数
  N[startAnimateTo] --> O[设置动画参数]
  O --> P[执行animateTo动画]
  P --> Q[更新指示器位置和宽度]
  end
```

**关键代码解析**

1. 导航条UI实现

   ~~~typescript
   // 导航条
   Column()
     .width(this.indicatorWidth)
     .height(2)
     .backgroundColor('#ff2f80b1')
     .borderRadius(2)
     .position({ x: this.indicatorLeftMargin, y: 780})
     .translate({ y: -2 }) // 向上偏移，确保显示在TabBar上方
     .zIndex(2) // 确保导航条在最上层
   ~~~

   ​		这段代码创建了一个简单的导航条UI，它是一个高度为2像素的细条，颜色为蓝色（`#ff2f80b1`），宽度和位置由`indicatorWidth`和`indicatorLeftMargin`两个变量动态控制。

2. 获取标签位置信息

   ~~~typescript
   private getTextInfo(index: number): Record<string, number> {
     let modePosition: componentUtils.ComponentInfo = componentUtils.getRectangleById(index.toString())
     return { 'left': px2vp(modePosition.windowOffset.x), 'width': px2vp(modePosition.size.width) }
   }
   ~~~

   这个方法通过标签的索引获取对应标签文本的位置和宽度信息。它使用`componentUtils.getRectangleById`API获取组件的位置信息，然后将像素值转换为视口像素（vp）单位。

3. 计算导航条动画位置

   ~~~typescript
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
   ~~~

   这个方法是导航条动画的核心，它计算在滑动过程中导航条的实时位置和宽度：

   1. 首先确定下一个索引位置
   2. 获取当前索引和下一个索引的位置信息
   3. 计算滑动比例
   4. 根据滑动比例计算当前导航条应该显示的位置和宽度
   5. 实现了导航条在两个标签之间平滑过渡的效果

4. 动画实现

   ~~~typescript
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
   ~~~

   这个方法使用`animateTo`函数实现导航条的动画效果：

   1. 设置动画时长
   2. 使用弹簧动画曲线（`curves.springMotion`）使动画更加自然
   3. 在动画回调中更新导航条的位置和宽度

5. 事件监听与动画触发

   ~~~typescript
   .onChange((index: number) => {
     this.selectedTab = index
     this.currentIndex = index
     // 切换时更新导航条位置和宽度
     let targetIndexInfo = this.getTextInfo(index)
     this.startAnimateTo(this.animationDuration, targetIndexInfo.left, targetIndexInfo.width)
   })
   
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
   ~~~

   这些事件监听器负责在不同场景下触发导航条动画：

   1. `onChange`：用户点击标签切换时触发
   2. `onAnimationStart`：切换动画开始时触发
   3. `onAnimationEnd`：切换动画结束时触发
   4. `onGestureSwipe`：用户滑动页面时逐帧触发，实现导航条跟随手指移动的效果

#### 3.5.2 Start页面过渡动画

```typescript
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
```

这段代码实现了启动页（Start）的淡出动画效果：

1. 使用`setTimeout`延迟2.5秒后开始动画
2. 使用`animateTo`创建一个持续500毫秒的淡出动画
3. 动画使用`Curve.EaseOut`曲线，使动画更加自然
4. 动画结束后，使用`replacePathByName`方法跳转到LayOut页面

#### 3.5.3 页面转场动画

```typescript
.transition({
  type:TransitionType.Insert,
  opacity: 1,
  translate: { x: 0, y: 0 }
})
```

这段代码定义了页面插入时的转场动画：

1. 使用`TransitionType.Insert`类型，表示页面插入时的动画
2. 设置不透明度从0到1的渐变效果
3. 设置位移动画，从初始位置平滑过渡

#### 3.5.4 播放模式切换动画

```typescript
// 添加播放模式切换动画
animateTo({
  duration: 400,
  curve: Curve.Friction,
}, () => {
  this.playMode=(this.playMode+1)%3
})
```

这段代码实现了播放页面中不同模式（唱片模式、歌词模式、运动模式）之间的切换动画：

1. 使用`animateTo`创建一个持续400毫秒的动画
2. 使用`Curve.Friction`曲线，模拟摩擦效果，使动画更加自然
3. 动画结束后，切换到下一个播放模式

## 4. 数据模型
### 4.1 GlobalMusic
```typescript
@ObservedV2
export class GlobalMusic {
  @Trace img: string = ""
  @Trace name: string = ""
  @Trace author: string = ""
  @Trace url: string = ""
  @Trace time: number = 0
  @Trace duration: number = 0
  @Trace playerIndex: number = 0
  @Trace playList: SongItemType[] = songs
  @Trace isPlay: boolean = false
  @Trace playMode: 'auto'|'random'|'repeat' = 'auto'
}
```
### 4.2 SongItemType
```typescript
export interface SongItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
  lrc?: string
}
```

## 5. 项目结构与开发环境
### 5.1 目录结构
```
ChiikaMusic/
├── AppScope/            # 应用配置
├── entry/               # 应用入口
│   ├── src/
│   │   └── main/
│   │       └── ets/
│   │           ├── entryability/      # 应用能力
│   │           ├── models/            # 数据模型
│   │           │   ├── GlobalMusic.ets # 全局音乐数据
│   │           │   ├── Healthy.ets    # 健康数据
│   │           │   ├── Lyric.ets      # 歌词数据
│   │           │   └── music.ets      # 音乐数据
│   │           ├── pages/             # 页面组件
│   │           │   ├── Index.ets      # 入口页面
│   │           │   ├── LayOUt.ets     # 主布局
│   │           │   ├── Mine.ets       # 我的页面
│   │           │   ├── Moment.ets     # 动态页面
│   │           │   ├── Music.ets      # 音乐列表
│   │           │   ├── Play.ets       # 播放页面
│   │           │   ├── Recommend.ets  # 推荐页面
│   │           │   └── Start.ets      # 启动页面
│   │           └── utils/             # 工具类
│   │               ├── ActivityManager.ets
│   │               ├── AvPlayerManager.ets  # 播放器管理
│   │               └── AvSessionManager.ets # 会话管理
└── oh-package.json     # 项目配置
```

### 6.2 开发环境

- DevEco Studio
- ArkUI 框架
- HarmonyOS SDK

## 6. 总结
ChiikaMusic 通过组件化、全局状态管理和高效的歌词同步机制，打造了功能完整、体验流畅的音乐播放应用。