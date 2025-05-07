import { avSession } from '@kit.AVSessionKit'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import { Want, wantAgent } from '@kit.AbilityKit'
import { GlobalMusic } from '../models/GlobalMusic'
import { AppStorageV2 } from '@kit.ArkUI'
import { SongItemType } from '../models/music'
import { playerManager } from './AvPlayerManager'

class AvSessionManager {
  session: avSession.AVSession | null = null
  playState:GlobalMusic=AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!
  async init(content: Context) {
    this.session = await avSession.createAVSession(content, 'bgPlay', 'audio') //三个参数：1.上下文，2.自定义name，3.sessionType
    this.registerEvent()
  }

  //申请长时任务
  async startBackgroundTask() {
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      // 点击通知后，将要执行的动作列表
      // 添加需要被拉起应用的bundleName和abilityName
      wants: [
        {
          bundleName: "com.example.myapplication",
          abilityName: "EntryAbility"
        }
      ],
      // 指定点击通知栏消息后的动作是拉起ability
      actionType: wantAgent.OperationType.START_ABILITY,
      // 使用者自定义的一个私有值
      requestCode: 0,
      // 点击通知后，动作执行属性
      actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
    };
    const want=await wantAgent.getWantAgent(wantAgentInfo)
    backgroundTaskManager.startBackgroundRunning(getContext(), backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK,
      want)
  }

  //设置元数据
  setAVMetadata(song:SongItemType){
    this.session?.setAVMetadata({
      assetId: song.id,
      title: song.name,
      artist: song.author,
      // album: song.album,
      duration: this.playState.duration,
      mediaImage:song.img
    })
  }

  //设置播放状态
  setAVPlayBackState(){
    this.session?.setAVPlaybackState({
      state: this.playState.isPlay ? avSession.PlaybackState.PLAYBACK_STATE_PLAY : avSession.PlaybackState.PLAYBACK_STATE_PAUSE, //播放状态:播放中、暂停中、播放结束、未知
      speed: 1.0,
      position:{
        elapsedTime: this.playState.time,
        updateTime:new Date().getTime()
      },
      duration: this.playState.duration
    })
  }

  //注册事件
  registerEvent(){
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

  //注销绘画
  async destroy(){
    await this.session?.destroy()
  }


}

export const avSessionManager: AvSessionManager = new AvSessionManager()