import { SongItemType } from "./music"

@ObservedV2
export class GlobalMusic {
  @Trace img: string = ""  // 音乐封面
  @Trace name: string = ""  // 音乐名称
  @Trace author: string = ""  // 作者
  @Trace url: string = ""  // 当前播放链接
  @Trace time: number = 0  // 播放时间
  @Trace duration: number = 0  // 音乐的播放时长
  @Trace songId:number=-1

  @Trace playerIndex:number=0
  @Trace playList:SongItemType[]=[]

  @Trace isPlay:boolean=false//  是否播放

  @Trace playMode:'auto'|'random'|'repeat'='auto'//播放模式

  //  设置
  set(song:SongItemType){
    this.img=song.img
    this.name=song.name
    this.author=song.author
    this.url=song.url
  }

  //  重置
  reset(){//全部置为默认值
    this.img=""
    this.name=""
    this.author=""
    this.url=""
    this.time=0
    this.duration=0
    this.songId=-1
    this.playerIndex=0
    this.playList=[]
    this.isPlay=false
    this.playMode='auto'
  }

  // 毫秒转时分秒
  number2time(number: number) {
    // 毫秒 → 秒 → 分+秒; 先判断是否大于1分钟
    if (number > 60 * 1000) {
      const s = Math.floor(number / 1000 % 60)
      const m = Math.floor(number / 1000 / 60)
      const second = s.toString().padStart(2, '0')
      const minute = m.toString().padStart(2, '0')
      return minute + ':' + second
    } else {
      const s = Math.floor(number / 1000 % 60)
      const second = s.toString().padStart(2, '0')
      return '00:' + second
    }
  }
}