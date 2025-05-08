import { SongItemType, songs } from "../models/music"


interface momentListType {
  author: string
  avatar: string
  content: string
  comment: number
  like: number
  song: SongItemType
}

@Entry
@Component
export struct MomentSquarePage {
  momentList: momentListType[] = [
    {
      author: 'Feast-aws',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h0.jpg',
      content: '若心怀畏惧，就翻越群山吧。向永不满足的内心，倾泻而下的流水带来治愈。《旅人の唄》让我感受到了生命的力量。',
      comment: 604,
      like: 23382,
      song: songs[0]
    },
    {
      author: 'CeeYet',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h1.jpg',
      content: '想要破坏，想要彻底摧毁，若是为了你的话，哪管什么不纯与矛盾。《オンリー》唱出了我内心深处的矛盾与执着。',
      comment: 1237,
      like: 5482,
      song: songs[1]
    },
    {
      author: 'Z_HOUSC',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h2.jpg',
      content: '在想象之上，无人能及之处，指尖缔结的约定即是永恒。《旅人の唄～帰郷～》让我想起了回家的路。',
      comment: 8425,
      like: 4234,
      song: songs[2]
    },
    {
      author: '逆转大师',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h3.jpg',
      content: '穿越轮回的星之子啊，请遵循命运安排。《目覚めの唄》唤醒了沉睡的灵魂，每当向世间真理寻求救赎，都寄托着虔诚祈愿。',
      comment: 7658,
      like: 11545,
      song: songs[3]
    },
    {
      author: 'Moriaty',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h4.jpg',
      content: '致迷途的旅人啊，请收下这星斗的光芒，倾听耕耘大地的回响。《祈りの唄》教会我向大地的每一粒尘埃献上感恩与祈愿。',
      comment: 543,
      like: 2234,
      song: songs[4]
    },
    {
      author: '丶你要去哪里',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h5.jpg',
      content: '林间喧嚣，屏息凝神，未曾相识却将身心托付。《継承の唄》让我明白，当交织的时光洪流尚未塑成我身之前，以无名的纯粹姿态将己身尽数献祭。',
      comment: 14415,
      like: 36297,
      song: songs[5]
    },
    {
      author: '一个人的某泥',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h6.jpg',
      content: '让初啼响彻世间，宣告生命降临的庄严。《遠くの子守の唄》如同母亲的摇篮曲，温柔地守护着每一个生命。',
      comment: 1237,
      like: 5482,
      song: songs[6]
    },
    {
      author: '曾经那个少年1993',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h7.jpg',
      content: '《Inori no Uta》让我感受到了祈祷的力量，就像在黑暗中点亮的一盏明灯，指引着前行的方向。无论多么迷茫，总有一束光照亮前路。',
      comment: 7628,
      like: 36448,
      song: songs[7]
    },
    {
      author: '柳崽崽阿',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h8.jpg',
      content: '《Tabibito no Uta》中那句"在想象之上，无人能及之处"，让我想起了自己的旅途。每一段旅程都是对自我的探索与超越。',
      comment: 1237,
      like: 5482,
      song: songs[8]
    },
    {
      author: '李富贵他哥',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h9.jpg',
      content: '《Only》唱出了爱的矛盾与执着，"想要守护的是教会我一切的你，只有你"，这种感情如此纯粹又复杂，让人沉醉其中。',
      comment: 7362,
      like: 11482,
      song: songs[9]
    },
    {
      author: '一檀溪一',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h10.jpg',
      content: '《Mezame no Uta》中"每当向世间真理寻求救赎，都寄托着虔诚祈愿"这句歌词，让我在迷茫时找到了前进的勇气。',
      comment: 6496,
      like: 8526,
      song: songs[10]
    },
    {
      author: '-_Dimple_',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h11.jpg',
      content: '《Inori no Uta》中"向大地的每一粒尘埃献上感恩与祈愿"，让我学会了感恩生活中的每一个细节，珍惜当下的每一刻。',
      comment: 1237,
      like: 5482,
      song: songs[11]
    },
    {
      author: 'h奔放小青年',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h12.jpg',
      content: '《Keishou no Uta》让我明白，我们都是时光长河中的一粒沙，但每一粒沙都有自己的价值和意义。以无名的纯粹姿态，将己身尽数献祭。',
      comment: 1237,
      like: 5482,
      song: songs[12]
    },
    {
      author: '您的坑友已上线',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h13.jpg',
      content: '《Tooku no Komori no Uta》如同母亲的摇篮曲，温柔地守护着每一个生命。让初啼响彻世间，宣告生命降临的庄严。',
      comment: 1237,
      like: 5482,
      song: songs[13]
    },
    {
      author: '一个人的某泥',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h14.jpg',
      content: '《Tabibito no Uta》中"若心怀畏惧，就翻越群山吧"这句歌词给了我面对困难的勇气。无论前路多么艰难，都要勇往直前。',
      comment: 1237,
      like: 5482,
      song: songs[14]
    },
    {
      author: '不想早起',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h15.jpg',
      content: '《Only》中"想要破坏，想要彻底摧毁，若是为了你的话"，唱出了爱的极致与矛盾。这种感情如此强烈，让人无法自拔。',
      comment: 1237,
      like: 5482,
      song: songs[15]
    }
  ]

  build() {
    Column({ space: 0 }) {
      // 标题
      Text('互动广场')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .margin({ top: 24, bottom: 20, left: 16 })

      // 互动内容列表
      List({ space: 0 }) {
        ForEach(this.momentList, (item: momentListType, index: number) => {
          ListItem() {
            Column() {
              // 用户信息和内容
              Row() {
                // 头像
                Image(item.avatar)
                  .width(50)
                  .height(50)
                  .borderRadius(25)
                  .border({ width: 2, color: '#87CEFA' })
                  // .align(Alignment.Top)
                // 用户名和内容
                Column() {
                  Text(item.author)
                    .fontSize(18)
                    .fontColor('#333333')
                    .fontWeight(FontWeight.Bold)
                    .width('100%')
                    .margin({left:10})
                  Text(item.content)
                    .fontSize(16)
                    .fontColor('#666666')
                    .width('100%')
                    .margin({ top: 2,left:10})
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .layoutWeight(1)
                // .align(Alignment.Top)
              }
              .width('90%')
              .margin({ left: 16, right: 16, top: 16 })
              .align(Alignment.TopStart)
              // 歌曲卡片
              Row() {
                // 歌曲封面
                Image(item.song.img.startsWith('http')?item.song.img:$r(item.song.img))
                  .width(60)
                  .height(60)
                  .borderRadius(16)
                  .border({ width: 2, color: '#87CEFA' })
                // 歌曲信息
                Column() {
                  Text(item.song.name)
                    .fontSize(16)
                    .fontColor('#333333')
                    .fontWeight(FontWeight.Bold)
                    .margin({ bottom: 4, left: 12 })
                  Text(item.song.author)
                    .fontSize(14)
                    .fontColor('#666666')
                    .margin({ left: 12 })
                }

                // 播放按钮
                Blank()
                Image($r('app.media.ic_play'))// 你需要准备一个播放按钮图片
                  .width(30)
                  .height(30)
                  .fillColor('#FF6B95')
                  .margin({ right: 12 })
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(20)
              .width('85%')
              .margin({ left: 1, right: 1, top: 12 })
              .height(70)
              .padding(8)
              .align(Alignment.Center)
              .backgroundColor('#fff5d9d9')

              // 操作栏
              Row({ space: 32 }) {
                // 分享
                Row() {
                  Image($r('app.media.ic_share'))// 你需要准备一个分享图标
                    .width(20)
                    .height(20)
                    .fillColor('#87CEFA')
                  Text('分享')
                    .fontSize(14)
                    .fontColor('#666666')
                    .fontWeight(FontWeight.Medium)
                    .margin({ left: 4 })
                }

                // 评论
                Row() {
                  Image($r('app.media.ic_comment'))// 你需要准备一个评论图标
                    .width(20)
                    .height(20)
                    .fillColor('#87CEFA')
                  Text(`${item.comment}`)
                    .fontSize(14)
                    .fontColor('#666666')
                    .fontWeight(FontWeight.Medium)
                    .margin({ left: 4 })
                }

                // 点赞
                Row() {
                  Image($r('app.media.ic_like'))// 你需要准备一个点赞图标
                    .width(20)
                    .height(20)
                    .fillColor('#87CEFA')
                  Text(`${item.like}`)
                    .fontSize(14)
                    .fontColor('#666666')
                    .fontWeight(FontWeight.Medium)
                    .margin({ left: 4 })
                }
              }
              .margin({
                left: 16,
                right: 16,
                top: 12,
                bottom: 12
              })
              .backgroundColor('#E6F3FF')
              .borderRadius(16)
              .padding(10)

              // 分割线
              Divider()
                .color('#B0E0FF')
                .height(2)
                .margin({ left: 16, right: 16, bottom: 10})
            }
          }
        }, (item: momentListType) => item.author + item.song.id)
      }
      .nestedScroll({
        scrollForward: NestedScrollMode.SELF_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST,
      })
    }
    .backgroundColor('#f0f8ff')
    .expandSafeArea()
  }
}
