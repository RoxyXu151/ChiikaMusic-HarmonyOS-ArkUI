// interface 抽离
interface UserInfoType {
  name: string
  vip: boolean
  desc: string
  detail: string
  follow: string
  fans: string
  like: string
}

@Component
export struct Mine {
  private userInfo: UserInfoType = {
    name: 'ChiikaMusic',
    vip: true,
    desc: '00后  双子座  北京  歌龄·18年',
    detail: '1 关注   100万 粉丝   1.67亿 赞',
    follow: '1 关注',
    fans: '100万 粉丝',
    like: '1.67亿 赞'
  }

  build() {
    Column() {
      // 上半部分：图片区域
      Stack() {
        // 背景大图（用Chiikawa风格的背景）
        Image($r('app.media.Chiikawa1')) // 使用Chiikawa相关图片
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
          .blur(8) // 轻微模糊效果
        // logo
        Column() {
          Image($r('app.media.ChiikaMusic')) // logo图片
            .width(90)
            .height(90)
            .borderRadius(45)
            .border({ width: 4, color: '#FFFFFF' })
            .margin({ bottom: 12 })
          // logo下方的文字
          Text('CHIIKA\nmusic')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .backgroundColor('#FFFFFF80') // 半透明白色背景
            .borderRadius(16)
            .padding(8)
            .textAlign(TextAlign.Center)
        }
        .align(Alignment.Center)
      }
      .height('60%')
      .width('100%')

      // 下半部分：介绍区域
      Column({ space: 15 }) {
        // 软件名和VIP
        Row() {
          Text(this.userInfo.name)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
          if (this.userInfo.vip) {
            Text('VIP')
              .fontSize(16)
              .fontColor('#87CEFA')
              .backgroundColor('#E6F3FF')
              .borderRadius(12)
              .margin({ left: 10, top: 2 })
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          }
        }
        .margin({ top: 20, left: 0 })

        // 用户基本信息
        Text(this.userInfo.desc)
          .fontSize(16)
          .fontColor('#666666')
          .margin({ top: 5 })

        // 账户信息
        Row({ space: 40 }) {
          Text(this.userInfo.follow)
            .fontSize(16)
            .fontColor('#87CEFA')
            .fontWeight(FontWeight.Medium)
          Text(this.userInfo.fans)
            .fontSize(16)
            .fontColor('#87CEFA')
            .fontWeight(FontWeight.Medium)
          Text(this.userInfo.like)
            .fontSize(16)
            .fontColor('#87CEFA')
            .fontWeight(FontWeight.Medium)
        }
        .margin({ top: 15 })
        .backgroundColor('#FFFFFF')
        .borderRadius(20)
        .padding(15)
        .width('90%')
      }
      .height('40%')
      .width('100%')
      .backgroundColor('#F0F8FF')
      .align(Alignment.TopStart)
      .padding({ left: 24, right: 24, top: 20 })
    }
    .backgroundColor('#F0F8FF')
    .expandSafeArea()
  }
}