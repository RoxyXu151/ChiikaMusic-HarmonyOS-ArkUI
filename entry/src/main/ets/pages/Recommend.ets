import { it } from "@ohos/hypium"

@ComponentV2
export struct Recommend {
  @Builder
  titleBuilder(title: string) {
    Row() {
      Text(title)
        .fontColor(Color.Black)
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.ic_more'))
        .width(22)
        .fillColor(Color.Blue)
    }
    .width('100%')
    .height(40)
  }

  // 每日推荐数据
  dailyRecommend: recommendDailyType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend1.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '每日推荐',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend2.png',
      title: '从 [Nothing on Me] 开启无限漫游',
      type: '私人漫游',
      top: '#382e2f',
      bottom: '#a37862'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend3.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '华语流行',
      top: '#a37862',
      bottom: '#174847'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend4.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '私人雷达',
      top: '#174847',
      bottom: '#174847'
    }
  ]
  //轮播图数据
  pictures: Resource[] = [
    $r('app.media.Chiikawa1'),
    $r('app.media.Chiikawa2'),
    $r('app.media.Chiikawa3'),
    $r('app.media.Chiikawa4'),
  // "https://wenbinxu151-typora.oss-cn-beijing.aliyuncs.com/typora/202505031018213.jpeg",
    // "https://wenbinxu151-typora.oss-cn-beijing.aliyuncs.com/typora/202505031018834.jpeg",
    // "https://wenbinxu151-typora.oss-cn-beijing.aliyuncs.com/typora/202505031018026.jpeg"
  ]
  // 推荐歌单数据
  recommendList: recommendListType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list1.jpg',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      count: '270.9万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list2.jpg',
      title: 'Yasuo和更多好听的 | 华语私人雷达 | 回忆8090',
      count: '476.1万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list3.jpg',
      title: 'Trap Remix丨当欧美热单遇上毒性低音',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list4.jpg',
      title: '满级人类进化之路必备BGM | 根本停不下来',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list5.jpg',
      title: '认真去聆听这个世界的每一分每一秒 (强烈推荐)',
      count: '362.8万'
    }
  ]

  build() {
    Column() {
      //搜索栏
      Row() {
        Image($r('app.media.ic_search'))
          .width(22)
          .fillColor(Color.Gray)
        TextInput({ placeholder: "你好" })
          .placeholderColor(Color.Gray)
          .fontColor(Color.Gray)
          .layoutWeight(1)
        Image($r('app.media.ic_code'))
          .width(22)
          .fillColor(Color.Gray)
      }
      .width('100%')
      .backgroundColor(Color.Black)
      .border({ radius: 20 })
      .padding({ left: 10, right: 10 })

      //轮播图
      Swiper() {
        ForEach(this.pictures, (item: string, index) => {
          Image(item)
            .width('100%')// .height(200)
            .borderRadius(10)
        })
      }.autoPlay(true)
      .margin({ top: 10 })
      .height(200)

      //每日推荐
      this.titleBuilder('每日推荐')
      List() {
        ForEach(this.dailyRecommend, (item: recommendDailyType, index) => {
          ListItem() {
            Column() {
              Text(item.type)
                .width('100%')
                .height(40)
                .backgroundColor(item.top)
                .padding({ left: 10 })
                .fontSize(18)
                .fontColor(Color.White)

              Image(item.img)
                .width('100%')

              Text(item.title)
                .width('100%')
                .height(40)
                .backgroundColor(item.bottom)
                .padding(5)
                .fontSize(12)
                .fontColor(Color.White)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })

            }
            .width('40%')
            .margin({ right: 10 })
            .backgroundColor(item.top)
            .border({ radius: 10 })
            .clip(true)
          }
        })
      }
      .listDirection(Axis.Horizontal)
      .height(230)
      .scrollBar(BarState.Off)

      //推荐歌单
      this.titleBuilder('推荐歌单')
      List() {
        ForEach(this.recommendList, (item: recommendListType, index) => {
          ListItem() {
            Column() {
              Stack({alignContent:Alignment.TopStart}) {
                Image(item.img)
                  .width('100%')
                  .height(100)
                  .border({radius:10})
                Text(item.count)
                  .fontColor(Color.White)
                  .fontSize(14)
                  .fontWeight(700)
                  .margin(5)
              }

              Text(item.title)
                .width('100%')
                .padding(5)
                .fontSize(12)
                .fontColor(Color.White)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .width('30%')
            .margin(5)
            .height(200)
            .clip(true)
            .margin({right:10})
          }
        })
      }
      .listDirection(Axis.Horizontal)
      // .height(230)
    }
    .width('100%')
    .height('100%')
    .padding({
      left: 20,
      right: 20,
      top: 5,
      bottom: 5
    })
  }
}

interface recommendDailyType {
  img: string // 图片
  title: string // 简介文字
  type: string // 标题文字
  top: string // 标题背景色
  bottom: string // 简介背景色
}

interface recommendListType {
  img: string
  title: string
  count: string
}

