export interface SongItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
  lrc?: string // 歌词属性，可选
}
// 阿里云存储的资源地址
export const baseUrl:string='https://hm-music.oss-cn-beijing.aliyuncs.com/'
// 歌曲信息列表
export const songs: SongItemType[] = [
  {
    img: 'app.media.song0',
    name: '旅人の唄',
    author: 'Beyond',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E6%97%85%E4%BA%BA%E3%81%AE%E5%94%84.mp3',
    id: '0000',
    lrc: '[ti:旅人の唄]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:03.00]编曲：MANYO\n' +
      '\n' +
      '[00:21.31]恐れるなら　山を越えていけ\n' +
      '[00:26.57]若心怀畏惧 就翻越群山吧\n' +
      '[00:31.82]満ち足りぬ　心に\n' +
      '[00:36.46]向永不满足的内心\n' +
      '[00:41.10]溢れ出す水が癒し与え\n' +
      '[00:46.98]倾泻而下的流水带来治愈\n' +
      '\n' +
      '[00:52.86]想像の上　誰も立てぬ場所\n' +
      '[00:57.45]在想象之上 无人能及之处\n' +
      '[01:02.03]慈しみ一つ恋しさを持てば\n' +
      '[01:06.18]若怀着一份怜爱与思念\n' +
      '[01:10.32]手にする愛\n' +
      '[01:13.51]便能触及真爱\n' +
      '\n' +
      '[01:19.29]静寂を知る　風の声は\n' +
      '[01:21.86]知晓寂静的风声\n' +
      '[01:24.43]止まり木をしならせ\n' +
      '[01:27.26]压弯栖息的枝头\n' +
      '[01:30.08]二度として同じ空　見せぬと歌う\n' +
      '[01:35.34]吟唱着"再不会让你看见同样的天空"\n' +
      '\n' +
      '[01:40.59]微睡の中　続くことを願い\n' +
      '[01:45.61]愿这份微眠能持续\n' +
      '[01:50.62]夢なら　振り向かずに\n' +
      '[01:55.95]若是梦境 便不要回头\n' +
      '\n' +
      '[02:01.27]想像の上　誰も立てぬ場所\n' +
      '[02:05.80]在想象之上 无人能及之处\n' +
      '[02:10.32]指先に一つ交わす約束は　永遠\n' +
      '[02:16.59]指尖缔结的约定 即是永恒\n' +
      '\n' +
      '[02:52.42]溢れ出す　祈り　癒し与え\n' +
      '[02:58.29]满溢的祈祷 带来治愈\n' +
      '[03:04.16]さようなら　さようなら\n' +
      '[03:06.75]再见了 再见了\n' +
      '[03:09.34]過ぐる日の私よ\n' +
      '[03:12.06]往昔的我啊\n' +
      '[03:14.77]さようなら　さようなら\n' +
      '[03:17.36]再见了 再见了\n' +
      '[03:19.95]記憶は残せど\n' +
      '[03:22.87]虽然记忆犹存\n' +
      '\n' +
      '[03:25.32]想像の上　誰も立てぬ場所\n' +
      '[03:29.89]在想象之上 无人能及之处\n' +
      '[03:34.44]慈しみひとつ恋しさを持てば\n' +
      '[03:38.62]若怀着一份怜爱与思念\n' +
      '[03:42.79]手にする愛\n' +
      '[03:47.11]便能触及真爱'
  },
  {
    img: 'app.media.song1',
    name: 'オンリー',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E3%82%AA%E3%83%B3%E3%83%AA%E3%83%BC.mp3',
    id: '0001',
    lrc:'[ti:オンリー]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：吉田穣\n' +
      '\n' +
      '[00:26.23]愛のイロハを学んでも\n' +
      '[00:27.75]即使学会爱的ABC\n' +
      '[00:29.27]手に入れられないのなんの\n' +
      '[00:30.91]却始终无法真正拥有\n' +
      '[00:32.54]戦い疲れ果てたコロニー\n' +
      '[00:33.97]在争斗中疲惫不堪的colony\n' +
      '[00:35.40]貴方が欲しい\n' +
      '[00:36.90]只渴望得到你\n' +
      '\n' +
      '[00:38.79](If you do)なんだって怖くないから\n' +
      '[00:41.99]（若你愿意）我便无所畏惧\n' +
      '[00:45.22](If you will)背中を任せて\n' +
      '[00:48.34]（若你愿意）将后背托付于你\n' +
      '\n' +
      '[00:51.45]壊したい　壊してしまいたい\n' +
      '[00:53.01]想要破坏 想要彻底摧毁\n' +
      '[00:54.58]貴方のためなら\n' +
      '[00:56.13]若是为了你的话\n' +
      '[00:57.68]不純も矛盾も見境なんてない\n' +
      '[01:00.81]哪管什么不纯与矛盾\n' +
      '[01:03.94]守りたい　守りたいのは全てを\n' +
      '[01:06.82]想要守护 想守护的是\n' +
      '[01:09.70]教えてくれた　貴方だけ\n' +
      '[01:12.79]教会我这一切的 只有你\n' +
      '\n' +
      '[01:30.10]目には目を歯を　尖っても\n' +
      '[01:31.73]以眼还眼 以牙还牙\n' +
      '[01:33.37]伝えられないの　でも\n' +
      '[01:35.07]却无法传达心意 但是\n' +
      '[01:36.56]悲しむ顔は負けなセオリー　素直でイタイ\n' +
      '[01:39.69]悲伤的表情是败北的法则 如此直白而痛苦\n' +
      '\n' +
      '[01:42.74](If you do)失っていいような未来\n' +
      '[01:45.98]（若你愿意）失去也无妨的未来\n' +
      '[01:49.22](If you will)端から見えていない\n' +
      '[01:52.39]（若你愿意）从一开始就看不见\n' +
      '\n' +
      '[01:55.61]壊したい　壊してしまいたい\n' +
      '[01:57.10]想要破坏 想要彻底摧毁\n' +
      '[01:58.58]貴方のためなら\n' +
      '[02:00.07]若是为了你的话\n' +
      '[02:01.55]不順も矛盾も見境なんてない\n' +
      '[02:04.72]哪管什么不顺与矛盾\n' +
      '[02:07.88]隠したい　隠したいのは全てを\n' +
      '[02:10.71]想要隐藏 想隐藏的是\n' +
      '[02:13.54]背負うと決めた　涙だけ\n' +
      '[02:16.58]决定背负的 只有泪水\n' +
      '\n' +
      '[02:21.01]背伸びして見える世界\n' +
      '[02:23.48]踮起脚尖才能看到的世界\n' +
      '[02:25.96]貴方のため？　自分のため\n' +
      '[02:28.77]是为了你？还是为了自己？\n' +
      '[02:33.57]まだわからない　感情の裏側\n' +
      '[02:38.19]仍不明白 感情的背面\n' +
      '\n' +
      '[02:43.31]壊したい　壊してしまいたい\n' +
      '[02:45.01]想要破坏 想要彻底摧毁\n' +
      '[02:46.61]戻れないのなら\n' +
      '[02:48.12]若已无法回头\n' +
      '[02:49.62]尚更強く抱きしめていたい\n' +
      '[02:52.79]反而更想紧紧拥抱\n' +
      '[02:55.96]離れない優しさを消し去っても\n' +
      '[02:58.76]即使抹去无法割舍的温柔\n' +
      '[03:01.66]悲しいくらい　溢れ出る思い\n' +
      '[03:04.66]悲伤满溢而出的思念\n' +
      '\n' +
      '[03:09.09]逃げない　逃げたくないこのジレンマから\n' +
      '[03:12.13]不会逃避 不想逃避这困境\n' +
      '[03:15.16]不順も矛盾も見境なんてない\n' +
      '[03:18.33]哪管什么不顺与矛盾\n' +
      '[03:21.51]守りたい守りたいのは全てを教えてくれた\n' +
      '[03:30.58]想要守护的是教会我一切的你\n' +
      '[03:33.16]貴方だけ\n' +
      '[03:35.35]只有你\n' +
      '\n' +
      '[03:45.46]和声：逆井寛子\n' +
      '[03:46.07]鼓：横瀬卓哉\n' +
      '[03:46.61]贝斯：蛇石徹\n' +
      '[03:47.23]吉他：吉田穣\n' +
      '[03:47.67]录音&混音：大串浩彰'
  },
  {
    img: 'app.media.song2',
    name: '旅人の唄～帰郷～',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E6%97%85%E4%BA%BA%E3%81%AE%E5%94%84%EF%BD%9E%E5%B8%B0%E9%83%B7%EF%BD%9E.mp3',
    id: '0002',
    lrc:'[ti:旅人の唄～帰郷～]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：MANYO\n' +
      '\n' +
      '[00:29.65]恐れるなら　山を越えていけ\n' +
      '[00:35.23]若心怀畏惧 就翻越群山吧\n' +
      '[00:40.80]満ち足りぬ　心に\n' +
      '[00:45.87]向永不满足的内心\n' +
      '[00:50.94]溢れ出す水が癒し与え\n' +
      '[00:57.52]倾泻而下的流水带来治愈\n' +
      '\n' +
      '[01:04.09]想像の上　誰も立てぬ場所\n' +
      '[01:09.01]在想象之上 无人能及之处\n' +
      '[01:13.92]慈しみ一つ恋しさを持てば\n' +
      '[01:18.49]若怀着一份怜爱与思念\n' +
      '[01:23.05]手にする愛\n' +
      '[01:26.37]便能触及真爱\n' +
      '\n' +
      '[01:38.48]静寂を知る　風の声は\n' +
      '[01:41.32]知晓寂静的风声\n' +
      '[01:44.16]止まり木をしならせ\n' +
      '[01:47.28]压弯栖息的枝头\n' +
      '[01:50.40]二度として同じ空　見せぬと歌う\n' +
      '[01:56.18]吟唱着"再不会让你看见同样的天空"\n' +
      '\n' +
      '[02:01.96]微睡の中　続くことを願い\n' +
      '[02:07.35]愿这份微眠能持续\n' +
      '[02:12.92]夢なら　振り向かずに\n' +
      '[02:18.59]若是梦境 便不要回头\n' +
      '\n' +
      '[02:24.45]想像の上　誰も立てぬ場所\n' +
      '[02:29.60]在想象之上 无人能及之处\n' +
      '[02:34.74]指先に一つ交わす約束は　永遠\n' +
      '[02:43.36]指尖缔结的约定 即是永恒\n' +
      '\n' +
      '[03:17.74]溢れ出す　祈り　癒し与え\n' +
      '[03:23.37]满溢的祈祷 带来治愈\n' +
      '[03:30.77]さようなら　さようなら\n' +
      '[03:33.59]再见了 再见了\n' +
      '[03:36.40]過ぐる日の私よ\n' +
      '[03:39.32]往昔的我啊\n' +
      '[03:42.24]さようなら　さようなら\n' +
      '[03:45.09]再见了 再见了\n' +
      '[03:47.94]記憶は残せど\n' +
      '[03:50.83]虽然记忆犹存\n' +
      '\n' +
      '[03:53.72]想像の上　誰も立てぬ場所\n' +
      '[03:58.76]在想象之上 无人能及之处\n' +
      '[04:03.79]慈しみひとつ恋しさを持てば\n' +
      '[04:08.40]若怀着一份怜爱与思念\n' +
      '[04:13.00]手にする愛\n' +
      '[04:16.35]便能触及真爱\n' +
      '\n' +
      '[04:36.04]吉他:吉田穣\n' +
      '[04:36.60]鼓:横瀬卓哉\n' +
      '[04:37.21]贝斯:蛇石徹\n' +
      '[04:37.72]钢琴:河内肇\n' +
      '[04:38.21]小提琴:多ヶ谷樹\n' +
      '[04:38.69]和声:逆井寛子'
  },
  {
    img: 'app.media.song3',
    name: '目覚めの唄',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E7%9B%AE%E8%A6%9A%E3%82%81%E3%81%AE%E5%94%84.mp3',
    id: '0003',
    lrc:'[ti:目覚めの唄]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：MANYO\n' +
      '\n' +
      '[00:13.20]忘るる事はなかれと\n' +
      '[00:16.44]「切勿遗忘」的箴言\n' +
      '[00:19.67]大地を這うは　いかづちの音\n' +
      '[00:22.88]大地上奔涌着雷鸣\n' +
      '[00:26.09]微睡む星も目覚めて\n' +
      '[00:28.89]连微眠的星辰也苏醒\n' +
      '[00:31.69]降り注ぐ矢の様に射る\n' +
      '[00:34.87]如箭雨般倾泻而下\n' +
      '\n' +
      '[00:38.05]息吹を与えしものの\n' +
      '[00:40.08]赐予生命的存在啊\n' +
      '[00:42.10]還りを祈ろう\n' +
      '[00:43.70]祈愿您重归此地\n' +
      '[00:45.29]数えきれぬ闇夜に\n' +
      '[00:48.49]在无数个漫漫长夜\n' +
      '[00:51.68]巡る時を知らす　この唄よ\n' +
      '[00:54.47]传颂时光轮回的歌谣\n' +
      '[00:57.25]絶えなくあなたに捧げましょう\n' +
      '[01:00.87]将永远为您献上\n' +
      '\n' +
      '[01:04.49]枯れ果てた視界のわずかな涙も\n' +
      '[01:07.66]即便干涸视野中残存的泪滴\n' +
      '[01:10.83]望む日まで残して\n' +
      '[01:16.42]也要留存至所盼之日\n' +
      '\n' +
      '[01:30.04]刹那に燃ゆる　火の粉を浴びて\n' +
      '[01:33.25]沐浴刹那燃烧的火星\n' +
      '[01:36.45]生き抜けば　訪れ時\n' +
      '[01:39.67]若能坚持生存 终将迎来\n' +
      '[01:42.89]苦しき日々や憎しみも\n' +
      '[01:45.47]连痛苦岁月与憎恨\n' +
      '[01:48.53]輝く　許しを得る\n' +
      '[01:51.81]也会闪耀 获得宽恕\n' +
      '\n' +
      '[02:21.74]輪廻を渡る　星の子どもよ\n' +
      '[02:24.71]穿越轮回的星之子啊\n' +
      '[02:27.67]定めに従えて\n' +
      '[02:29.72]请遵循命运安排\n' +
      '[02:35.77]巡る時を知らす　この唄よ\n' +
      '[02:38.50]传颂时光轮回的歌谣\n' +
      '[02:41.23]絶えなくあなたに捧げましょう\n' +
      '[02:44.86]将永远为您献上\n' +
      '\n' +
      '[02:48.49]この世の真実に救いを問うたび\n' +
      '[02:51.70]每当向世间真理寻求救赎\n' +
      '[02:54.90]祈りを込めて\n' +
      '[03:00.11]都寄托着虔诚祈愿\n' +
      '\n' +
      '[03:14.08]導きを待たずと遥かな過去から\n' +
      '[03:17.30]无需指引 自遥远往昔\n' +
      '[03:20.51]途切れさせぬ祈りよ\n' +
      '[03:27.13]永不间断的祈愿啊\n' +
      '\n' +
      '[04:30.77]吉他：吉田穰\n' +
      '[04:31.42]鼓：横瀬卓哉\n' +
      '[04:32.06]贝斯：蛇石徹\n' +
      '[04:32.76]钢琴：河内肇\n' +
      '[04:33.37]小提琴：多ヶ谷樹\n' +
      '[04:34.04]大提琴：向井航\n' +
      '[04:34.70]手摇风琴：久野幹史\n' +
      '[04:35.47]和声：逆井寛子\n' +
      '[04:36.18]其他乐器：MANYO\n' +
      '[04:36.85]录音&混音：大串浩彰'
  },
  {
    img: 'app.media.song4',
    name: ' 祈りの唄',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E7%A5%88%E3%82%8A%E3%81%AE%E5%94%84.mp3',
    id: '0004',
    lrc:'[ti:祈りの唄]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:00.00]作曲：大原ゆい子\n' +
      '[00:00.00]编曲：MANYO\n' +
      '\n' +
      '[00:00.65]行き先を迷う者へ\n' +
      '[00:04.80]致迷途的旅人啊\n' +
      '[00:08.94]星斗(せいと)のひかりを\n' +
      '[00:13.33]请收下这星斗的光芒\n' +
      '[00:17.72]耕した土の声\n' +
      '[00:21.66]倾听耕耘大地的回响\n' +
      '[00:25.60]生命(いのち)のはじまりに\n' +
      '[00:32.22]在生命起源之处\n' +
      '\n' +
      '[00:38.84]荒野の憂いも　流す雨を給う\n' +
      '[00:48.71]连荒原的哀愁 都化作滋润之雨\n' +
      '\n' +
      '[00:58.58]Ah 大地の一粒に\n' +
      '[01:02.74]啊 向大地的每一粒尘埃\n' +
      '[01:06.90]捧げよ　感謝と祈りを\n' +
      '[01:12.18]献上感恩与祈愿\n' +
      '\n' +
      '[01:19.60]この身を永久(とこしえ)に\n' +
      '[01:23.84]将这副身躯永远\n' +
      '[01:28.08]委ねた現世(うつしよ)の\n' +
      '[01:31.98]托付给现世的\n' +
      '[01:35.89]悲しみも憎しみも\n' +
      '[01:40.22]无论悲伤还是憎恨\n' +
      '[01:44.55]全て無駄にはならず\n' +
      '[01:51.28]都不会徒劳无功\n' +
      '\n' +
      '[02:06.60]Ah 大地の一粒に\n' +
      '[02:10.85]啊 向大地的每一粒尘埃\n' +
      '[02:14.34]捧げよ　感謝と祈りを\n' +
      '[02:19.81]献上感恩与祈愿\n' +
      '\n' +
      '[02:32.01]生きとし生けるものよ\n' +
      '[02:35.89]所有活着的生灵啊\n' +
      '[02:39.76]御霊の遺産たちよ\n' +
      '[02:44.35]神明赐予的遗产啊\n' +
      '[02:48.93]僅かな糧と望み\n' +
      '[02:52.82]将微薄的食粮与希望\n' +
      '[02:56.71]分かち合う誓い\n' +
      '[03:01.33]立下共享的誓言\n' +
      '\n' +
      '[03:05.94]Ah 大地の一粒に\n' +
      '[03:10.14]啊 向大地的每一粒尘埃\n' +
      '[03:14.34]捧げよ　祈りを\n' +
      '[03:18.70]献上虔诚的祈祷\n' +
      '\n' +
      '[03:23.05]Ah 大地の一粒に\n' +
      '[03:27.19]啊 向大地的每一粒尘埃\n' +
      '[03:31.33]捧げよ　感謝と祈りを\n' +
      '[03:38.83]献上感恩与祈愿\n' +
      '\n' +
      '[04:22.51]管风琴：石丸由佳\n' +
      '[04:23.11]吉他：吉田穣\n' +
      '[04:23.73]爱尔兰竖琴：梅田千晶\n' +
      '[04:24.30]和声：逆井寛子/KOCHO/河野陽介'
  },
  {
    img: 'app.media.song5',
    name: '継承の唄',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E7%B6%99%E6%89%BF%E3%81%AE%E5%94%84.mp3',
    id: '0005',
    lrc:'[ti:継承の唄]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：MANYO\n' +
      '[00:03.00]\n' +
      '[00:18.81]木々の騒めき　息を潜めて\n' +
      '[00:21.86]林间喧嚣 屏息凝神\n' +
      '[00:24.91]互いの名も知らぬままに　この身を委ね\n' +
      '[00:27.96]未曾相识却将身心托付\n' +
      '[00:30.91]茂みの奥の微かな木漏れ日は\n' +
      '[00:33.97]树影深处的斑驳微光\n' +
      '[00:37.03]どこか母の温もりのよう\n' +
      '[00:40.07]恍若母亲怀抱的温暖\n' +
      '[00:43.10]古人(いにしえびと)の　残した性よ\n' +
      '[00:46.15]先民传承的血脉啊\n' +
      '[00:49.19]刻まれた胸が疼いている\n' +
      '[00:52.25]铭刻胸口的灼痛在蔓延\n' +
      '[00:55.32]声よ　木霊よ\n' +
      '[00:57.08]回声啊 山林之灵啊\n' +
      '[00:58.83]今望む　言葉を聞かせて\n' +
      '[01:01.64]请聆听我此刻的祈愿\n' +
      '[01:07.44]霧の向こうへと進んで\n' +
      '[01:10.36]向迷雾彼岸前行吧\n' +
      '[01:13.28]彷徨いあう前に\n' +
      '[01:16.46]在迷途相遇之前\n' +
      '\n' +
      '[01:34.83]せせらぎの夢　汲み取り浴びて\n' +
      '[01:37.90]掬取溪流的梦境沐浴\n' +
      '[01:40.97]木の葉の船　揺らす水面　孤独に沈む\n' +
      '[01:44.01]叶舟轻摇水面 沉入孤寂\n' +
      '[01:47.05]雨風たちと　変わらぬ移り気で\n' +
      '[01:50.11]风雨无常的任性依旧\n' +
      '[01:53.16]泥にまみれた心洗う\n' +
      '[01:56.16]涤净染尽淤泥的心灵\n' +
      '[01:59.20]遠く滲んだ　追憶の中\n' +
      '[02:02.23]渗入远方的追忆里\n' +
      '[02:05.26]忘れかけた想いを見つけた\n' +
      '[02:08.33]寻回即将消逝的思念\n' +
      '[02:11.40]声よ　木霊よ\n' +
      '[02:13.17]回声啊 山林之灵啊\n' +
      '[02:14.94]今望む言葉を教えて\n' +
      '[02:17.76]请赐予我渴求的话语\n' +
      '[02:23.38]混じり合う時の流れが\n' +
      '[02:26.37]当交织的时光洪流\n' +
      '[02:29.35]私になる前に\n' +
      '[02:32.56]尚未塑成我身之前\n' +
      '\n' +
      '[03:00.07]面影を辿れば　見知るほどに戸惑う\n' +
      '[03:06.13]追寻残影愈深 愈觉惶惑不安\n' +
      '[03:12.19]汚れを秘めぬ川の流れに沿わせて\n' +
      '[03:18.30]沿着坦荡无垢的河流行走\n' +
      '\n' +
      '[03:25.95]どうか声よ　木霊よ\n' +
      '[03:28.48]恳请回声 山林之灵啊\n' +
      '[03:31.00]今望む言葉を聞かせて\n' +
      '[03:33.80]倾听我此刻真切的祈愿\n' +
      '[03:39.60]霧の向こうへと進んで\n' +
      '[03:42.51]向迷雾彼岸前行吧\n' +
      '[03:45.41]彷徨いあう前に\n' +
      '[03:48.59]在迷途相遇之前\n' +
      '[03:51.77]天よ　大地よ\n' +
      '[03:53.58]苍天啊 大地啊\n' +
      '[03:55.38]今歌う　この歌を聴いて\n' +
      '[03:58.19]请聆听此刻传承的歌声\n' +
      '[04:03.94]混じり合う時の流れが\n' +
      '[04:06.90]当交织的时光洪流\n' +
      '[04:09.86]私になる前に\n' +
      '[04:12.91]尚未塑成我身之前\n' +
      '[04:15.85]何者でもないまま\n' +
      '[04:19.73]以无名的纯粹姿态\n' +
      '[04:23.49]この身を捧げましょう\n' +
      '[04:27.35]将己身尽数献祭\n' +
      '\n' +
      '[05:00.78]吉他：吉田穣\n' +
      '[05:01.58]钢琴：河内肇\n' +
      '[05:02.38]贝斯：蛇石徹\n' +
      '[05:03.16]鼓手/打击乐：横瀬卓哉\n' +
      '[05:03.88]和声：逆井寛子'
  },
  {
    img: 'app.media.song6',
    name: '遠くの子守の唄',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E9%81%A0%E3%81%8F%E3%81%AE%E5%AD%90%E5%AE%88%E3%81%AE%E5%94%84.mp3',
    id: '0006',
    lrc:'[ti:遠くの子守の唄]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：MANYO\n' +
      '[00:03.00]\n' +
      '[00:18.18]産声を響かせて\n' +
      '[00:21.18]让初啼响彻世间\n' +
      '[00:24.17]遍く世に知らせよ\n' +
      '[00:27.14]宣告生命降临的庄严\n' +
      '[00:30.11]天からの授かり物\n' +
      '[00:33.06]上天赐予的珍贵礼物\n' +
      '[00:36.00]数多の命の中\n' +
      '[00:39.00]在万千生灵中闪耀\n' +
      '[00:42.00]森を燃やす赤子は\n' +
      '[00:45.00]焚尽森林的赤子啊\n' +
      '[00:48.00]抱かれ眠る夜もなく\n' +
      '[00:50.91]从未拥有安眠的怀抱\n' +
      '[00:53.82]力と引き換えにして\n' +
      '[00:56.82]以力量作为交换代价\n' +
      '[00:59.81]愛に触れられず\n' +
      '[01:02.84]却与温暖爱意隔绝\n' +
      '[01:05.87]眠れ眠れ　母の声\n' +
      '[01:08.79]睡吧睡吧 母亲的呼唤\n' +
      '[01:11.70]子守唄に託して\n' +
      '[01:14.66]寄于摇篮曲的呢喃\n' +
      '[01:17.61]閉じれ閉じれ　呪いだけ\n' +
      '[01:20.64]封印吧 那诅咒之声\n' +
      '[01:23.66]覚めずに眠れ　眠れ\n' +
      '[01:26.57]永远沉入无梦的深渊\n' +
      '\n' +
      '[01:41.37]小さな町に生まれた\n' +
      '[01:44.40]诞生于小镇的婴孩啊\n' +
      '[01:47.42]可愛い赤子にまた\n' +
      '[01:50.39]再度被选中的幼小生命\n' +
      '[01:53.36]天からの授かり物\n' +
      '[01:56.36]神明馈赠的非凡智慧\n' +
      '[01:59.36]食うに困らぬ知\n' +
      '[02:02.32]解开了生存的困境\n' +
      '[02:05.28]雲の上　気まぐれに\n' +
      '[02:08.27]云端之上 神明随意\n' +
      '[02:11.26]与えた力の\n' +
      '[02:14.22]赐予的力量背后\n' +
      '[02:17.18]未来を見ている\n' +
      '[02:20.18]早已预见未来轨迹\n' +
      '[02:23.17]眠れ眠れ　神の子よ\n' +
      '[02:26.12]睡吧睡吧 神之幼子\n' +
      '[02:29.07]災いをさけるように\n' +
      '[02:32.02]愿你能避开灾祸侵扰\n' +
      '[02:34.96]人の子の心から\n' +
      '[02:37.99]莫要让凡人的心灵\n' +
      '[02:41.02]離れぬように　眠れ\n' +
      '[02:43.99]与你渐远 沉沉睡去\n' +
      '\n' +
      '[02:58.82]定めを受け入れよ\n' +
      '[03:01.81]接受既定的命运吧\n' +
      '[03:04.79]涙は誰の目にも滴るもの\n' +
      '[03:10.70]泪水本是人类共有的语言\n' +
      '[03:16.61]眠れ眠れ　私の子よ\n' +
      '[03:19.60]睡吧睡吧 我的孩子\n' +
      '[03:22.59]どんな姿形も\n' +
      '[03:25.56]无论你变成何种模样\n' +
      '[03:28.52]愛している　愛している\n' +
      '[03:31.55]我永远爱 永远爱你\n' +
      '[03:34.57]安心して眠れ　眠れ　眠れ\n' +
      '[03:40.49]请安心沉睡 永眠不醒\n' +
      '\n' +
      '[04:11.47]吉他：吉田穣\n' +
      '[04:12.12]鼓手：横瀬卓哉\n' +
      '[04:12.79]贝斯：蛇石徹\n' +
      '[04:13.41]钢琴：河内肇\n' +
      '[04:14.06]和声：逆井寛子\n' +
      '[04:14.75]二胡：土屋玲子'
  },
  {
    img: 'app.media.song7',
    name: '風と行く道',
    author: '大原ゆい子',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E9%A2%A8%E3%81%A8%E8%A1%8C%E3%81%8F%E9%81%93.mp3',
    id: '0007',
    lrc:'[ti:風と行く道]  \n' +
      '[ar:大原ゆい子]  \n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]  \n' +
      '[by:南归]  \n' +
      '[00:00.00]作词：大原ゆい子  \n' +
      '[00:01.00]作曲：大原ゆい子  \n' +
      '[00:02.00]编曲：吉田穣  \n' +
      '[00:03.00]  \n' +
      '[00:24.68]窓辺で見ていた空と  \n' +
      '[00:27.64]曾在窗边凝望的天空  \n' +
      '[00:30.60]この空は同じなのか  \n' +
      '[00:33.43]是否仍是同一片苍穹  \n' +
      '[00:36.25]黄昏は心を読むように  \n' +
      '[00:39.03]黄昏似能读懂我的思绪  \n' +
      '[00:41.81]色付いているみたいだ  \n' +
      '[00:44.71]为万物染上温柔颜色  \n' +
      '[00:49.15]無邪気な日々を置いた場所で  \n' +
      '[00:51.60]在封存天真岁月之处  \n' +
      '[00:54.04]風が僕らを迎えるように吹いている  \n' +
      '[00:58.45]清风如迎接我们般吹拂  \n' +
      '[01:02.85]変わらないで　街も人も夢にまでみたまま  \n' +
      '[01:07.79]请别改变 街道 人们 连梦中景象都如初  \n' +
      '[01:12.73]あの日のように一番星に願う  \n' +
      '[01:18.21]如那日般向启明星祈愿  \n' +
      '[01:23.69]帰りの道  \n' +
      '[01:26.25]归途的方向  \n' +
      '' +
      '[01:47.07]目覚まし代わりの悪夢  \n' +
      '[01:50.05]取代闹钟的骇人噩梦  \n' +
      '[01:53.02]泣いて目覚めた朝には  \n' +
      '[01:55.81]啜泣着醒来的清晨里  \n' +
      '[01:58.60]優しく撫でてくれた母の温もりを思い出した  \n' +
      '[02:04.90]忆起母亲轻抚的温柔  \n' +
      '[02:10.11]ただいまの後の空白を  \n' +
      '[02:12.53]归家问候后的空白寂寥  \n' +
      '[02:14.95]懐かしさの残るこの景色に託して  \n' +
      '[02:19.32]托付给残留怀念的街景  \n' +
      '[02:23.69]変わっていく　街も人も夢も刻一刻と  \n' +
      '[02:28.75]不断变迁 街道 人们 梦想每刻流转不息  \n' +
      '[02:33.80]だからこそ僕らはもっと強くなれる  \n' +
      '[02:40.15]正因如此我们愈发坚强  \n' +
      '' +
      '[03:08.71]道のない道を越えて　どんな色の空も  \n' +
      '[03:14.08]穿越无路之径 终将知晓  \n' +
      '[03:19.45]いつかは美しくなる事を知った  \n' +
      '[03:25.81]所有天空终会绽放美好  \n' +
      '[03:32.16]帰ってきた　目を閉じれば  \n' +
      '[03:37.69]当我归来阖上双眼时  \n' +
      '[03:43.22]会いたかった　街も人も夢も刻一刻と  \n' +
      '[03:48.78]思念的街道 人们 梦想仍时刻更迭不止  \n' +
      '[03:54.34]変わっていく  \n' +
      '[03:57.13]止めどなく流れ続ける川のように  \n' +
      '[04:01.84]如川流不息的河水奔涌  \n' +
      '[04:05.54]目を閉じればここは  \n' +
      '[04:07.65]闭上双眼便会发现此处  \n' +
      '[04:09.75]いつも　いつも　いつだって  \n' +
      '[04:12.65]永远 永远 始终如一的  \n' +
      '[04:15.55]変わることのない景色が僕らの側にいるよ  \n' +
      '[04:23.08]不变的风景守护在身旁  \n' +
      '' +
      '[04:52.21]和声：逆井寛子  \n' +
      '[04:52.84]吉他：吉田穣  \n' +
      '[04:53.52]贝斯：蛇石徹  \n' +
      '[04:54.19]鼓：横瀬卓哉  \n' +
      '[04:54.85]钢琴：河内肇'
  },
  {
    img: 'app.media.song8',
    name: 'ツバサ',
    author: '若山詩音',
    url: baseUrl+'%E8%8B%A5%E5%B1%B1%E8%A9%A9%E9%9F%B3%20-%20%E3%83%84%E3%83%90%E3%82%B5.mp3',
    id: '0008'
  },
  {
    img: 'app.media.song0',
    name: 'オンリー',
    author: '卢冠廷 / 莫文蔚',
    url: baseUrl+'%E5%A4%A7%E5%8E%9F%E3%82%86%E3%81%84%E5%AD%90%20-%20%E3%82%AA%E3%83%B3%E3%83%AA%E3%83%BC.mp3',
    id: '0009',
    lrc:'[ti:オンリー]\n' +
      '[ar:大原ゆい子]\n' +
      '[al:無職転生 ～異世界行ったら本気出す～ Theme Song Collection]\n' +
      '[by:南归]\n' +
      '[00:00.00]作词：大原ゆい子\n' +
      '[00:01.00]作曲：大原ゆい子\n' +
      '[00:02.00]编曲：吉田穣\n' +
      '[00:03.00]\n' +
      '\n' +
      '[00:26.23]愛のイロハを学んでも\n' +
      '[00:27.75]即使学会爱的ABC\n' +
      '[00:29.27]手に入れられないのなんの\n' +
      '[00:30.91]却始终无法真正拥有\n' +
      '[00:32.54]戦い疲れ果てたコロニー\n' +
      '[00:33.97]在争斗中疲惫不堪的colony\n' +
      '[00:35.40]貴方が欲しい\n' +
      '[00:36.90]只渴望得到你\n' +
      '[00:38.79](If you do)なんだって怖くないから\n' +
      '[00:41.99]（若你愿意）我便无所畏惧\n' +
      '[00:45.22](If you will)背中を任せて\n' +
      '[00:48.34]（若你愿意）将后背托付于你\n' +
      '\n' +
      '[00:51.45]壊したい　壊してしまいたい\n' +
      '[00:53.01]想要破坏 想要彻底摧毁\n' +
      '[00:54.58]貴方のためなら\n' +
      '[00:56.13]若是为了你的话\n' +
      '[00:57.68]不純も矛盾も見境なんてない\n' +
      '[01:00.81]哪管什么不纯与矛盾\n' +
      '[01:03.94]守りたい　守りたいのは全てを\n' +
      '[01:06.82]想要守护 想守护的是\n' +
      '[01:09.70]教えてくれた　貴方だけ\n' +
      '[01:12.79]教会我这一切的 只有你\n' +
      '\n' +
      '[01:30.10]目には目を歯を　尖っても\n' +
      '[01:31.73]以眼还眼 以牙还牙\n' +
      '[01:33.37]伝えられないの　でも\n' +
      '[01:35.07]却无法传达心意 但是\n' +
      '[01:36.56]悲しむ顔は負けなセオリー　素直でイタイ\n' +
      '[01:39.69]悲伤的表情是败北的法则 如此直白而痛苦\n' +
      '[01:42.74](If you do)失っていいような未来\n' +
      '[01:45.98]（若你愿意）失去也无妨的未来\n' +
      '[01:49.22](If you will)端から見えていない\n' +
      '[01:52.39]（若你愿意）从一开始就看不见\n' +
      '\n' +
      '[01:55.61]壊したい　壊してしまいたい\n' +
      '[01:57.10]想要破坏 想要彻底摧毁\n' +
      '[01:58.58]貴方のためなら\n' +
      '[02:00.07]若是为了你的话\n' +
      '[02:01.55]不順も矛盾も見境なんてない\n' +
      '[02:04.72]哪管什么不顺与矛盾\n' +
      '[02:07.88]隠したい　隠したいのは全てを\n' +
      '[02:10.71]想要隐藏 想隐藏的是\n' +
      '[02:13.54]背負うと決めた　涙だけ\n' +
      '[02:16.58]决定背负的 只有泪水\n' +
      '\n' +
      '[02:21.01]背伸びして見える世界\n' +
      '[02:23.48]踮起脚尖才能看到的世界\n' +
      '[02:25.96]貴方のため？　自分のため\n' +
      '[02:28.77]是为了你？还是为了自己？\n' +
      '[02:33.57]まだわからない　感情の裏側\n' +
      '[02:38.19]仍不明白 感情的背面\n' +
      '\n' +
      '[02:43.31]壊したい　壊してしまいたい\n' +
      '[02:45.01]想要破坏 想要彻底摧毁\n' +
      '[02:46.61]戻れないのなら\n' +
      '[02:48.12]若已无法回头\n' +
      '[02:49.62]尚更強く抱きしめていたい\n' +
      '[02:52.79]反而更想紧紧拥抱\n' +
      '[02:55.96]離れない優しさを消し去っても\n' +
      '[02:58.76]即使抹去无法割舍的温柔\n' +
      '[03:01.66]悲しいくらい　溢れ出る思い\n' +
      '[03:04.66]悲伤满溢而出的思念\n' +
      '\n' +
      '[03:09.09]逃げない　逃げたくないこのジレンマから\n' +
      '[03:12.13]不会逃避 不想逃避这困境\n' +
      '[03:15.16]不順も矛盾も見境なんてない\n' +
      '[03:18.33]哪管什么不顺与矛盾\n' +
      '[03:21.51]守りたい守りたいのは全てを教えてくれた\n' +
      '[03:30.58]想要守护的是教会我一切的你\n' +
      '[03:33.16]貴方だけ\n' +
      '[03:35.35]只有你\n' +
      '\n' +
      '[03:45.46]和声：逆井寛子\n' +
      '[03:46.07]鼓：横瀬卓哉\n' +
      '[03:46.61]贝斯：蛇石徹\n' +
      '[03:47.23]吉他：吉田穣\n' +
      '[03:47.67]录音&混音：大串浩彰'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
    name: '月半小夜曲',
    author: '李克勤',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
    id: '0010'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
    name: 'Rolling in the Deep',
    author: 'Adele',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
    id: '0011'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
    name: '海阔天空',
    author: 'Beyond',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
    id: '0012'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
    name: '直到世界的尽头',
    author: 'WANDS',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
    id: '0014',
    lrc:'[ti:直到世界的尽头]\n' +
      '[ar:WANDS]\n' +
      '[al:PIECE OF MY SOUL]\n' +
      '[by:SearchGPT]\n' +
      '[offset:0]\n' +
      '\n' +
      '[00:00.00]直到世界的尽头 - WANDS\n' +
      '[00:04.00]词：上杉升\n' +
      '[00:05.00]曲：织田哲郎\n' +
      '[00:38.00]大都会に 僕はもう一人で\n' +
      '[00:42.00]彷徨在大都市 孤身一人\n' +
      '[00:48.00]投げ捨てられた 空きカンのようだ\n' +
      '[00:51.00]就像被人丢弃的空啤酒罐\n' +
      '[00:55.00]互いのすべてを 知りつくすまでが\n' +
      '[00:59.00]如果非要探究彼此的一切\n' +
      '[01:04.00]愛ならば いっそ 永久に眠ろうか\n' +
      '[01:07.00]才叫爱的话 那还不如长眠\n' +
      '[01:13.00]世界が終わるまでは 離れる事もない\n' +
      '[01:17.00]直到世界的尽头 也不愿与你分离\n' +
      '[01:23.00]そう願っていた 幾千の夜と\n' +
      '[01:27.00]曾在千万个夜晚许下心愿\n' +
      '[01:31.00]戻らない時だけが 何故輝いては\n' +
      '[01:36.00]一去不回的时光 为何却如此耀眼\n' +
      '[01:41.00]やつれ切った 心までも 壊す\n' +
      '[01:44.00]对憔悴不堪的心 落井下石\n' +
      '[01:50.00]儚き想い この tragedy night\n' +
      '[01:55.00]渺茫的思念 在这个悲剧的夜\n' +
      '[02:06.00]そして人は 形を求めて\n' +
      '[02:09.00]而人们总是追求表面的答案\n' +
      '[02:15.00]かけがえのない 何かを失う\n' +
      '[02:18.00]结果错失无可替代的宝物\n' +
      '[02:23.00]欲望だらけの 街じゃ 夜空の\n' +
      '[02:27.00]在这个充斥着欲望的街头\n' +
      '[02:32.00]星屑も 僕らを 灯せない\n' +
      '[02:40.00]就连夜空繁星 也无法照亮我们\n' +
      '[02:45.00]世界が終わる前に 聞かせておくれよ\n' +
      '[02:50.00]在世界结束之前 谁愿意给我讲一个\n' +
      '[02:55.00]満開の花が 似合いの catastrophe\n' +
      '[02:59.00]与繁花盛开 最贴切的不幸\n' +
      '[03:04.00]誰もが望みながら 永遠を信じない\n' +
      '[03:09.00]谁都满怀着希望 却又不相信永远\n' +
      '[03:12.00]なのに きっと 明日を夢見てる\n' +
      '[03:17.00]可是也一定想着明天\n' +
      '[03:23.00]儚き日々と この tragedy night\n' +
      '[03:50.00]短暂的时光 与这悲剧的夜\n' +
      '[03:54.00]世界が終わるまでは 離れる事もない\n' +
      '[04:00.00]直到世界的尽头 也不愿与你分离\n' +
      '[04:04.00]そう願っていた 幾千の夜と\n' +
      '[04:08.00]曾在千万个夜晚许下心愿\n' +
      '[04:13.00]戻らない時だけが なぜ輝いては\n' +
      '[04:18.00]一去不回的时光 为何却如此耀眼\n' +
      '[04:21.00]やつれ切った 心までも 壊す\n' +
      '[04:27.00]对憔悴不堪的心 落井下石\n' +
      '[04:32.00]儚き想い この tragedy night\n' +
      '[04:36.00]渺茫的思念 在这个悲剧的夜\n'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
    name: '画',
    author: '赵磊',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
    id: '0015',
    lrc:'[ti:画]\n' +
      '[ar:赵雷]\n' +
      '[al:赵小雷]\n' +
      '[by:ChatGPT]\n' +
      '[offset:0]\n' +
      '[00:26.88]为寂寞的夜空画上一个月亮\n' +
      '[00:32.13]把我画在那月亮下面歌唱\n' +
      '[00:37.34]为冷清的房子画上一扇大窗\n' +
      '[00:42.54]再画上一张床\n' +
      '[00:47.73]画一个姑娘陪着我\n' +
      '[00:52.92]再画个花边的被窝\n' +
      '[00:58.20]画上灶炉与柴火\n' +
      '[01:03.40]我们一起生来一起活\n' +
      '[01:08.63]Du du lu lu du du lu lu\n' +
      '[01:13.81]Du du lu lu du du lu lu\n' +
      '[01:19.03]Du du lu lu du du lu lu\n' +
      '[01:24.25]Du du lu lu du du lu lu\n' +
      '[01:29.49]画一群鸟儿围着我\n' +
      '[01:34.72]再画上绿岭和青坡\n' +
      '[01:39.93]画上宁静与祥和\n' +
      '[01:45.14]雨点儿在稻田上飘落\n' +
      '[01:50.31]画上有你能用手触到的彩虹\n' +
      '[01:55.58]画中有我决定不灭的星空\n' +
      '[02:00.80]画上弯曲无尽平坦的小路\n' +
      '[02:06.04]尽头的人家梦已入\n' +
      '[02:11.33]画上母亲安详的姿势\n' +
      '[02:16.43]还有橡皮能擦去的争执\n' +
      '[02:21.65]画上四季都不愁的粮食\n' +
      '[02:26.92]悠闲的人从没心事\n' +
      '[02:32.14]Na na na na na na na na\n' +
      '[02:37.28]Na na na na na na na na\n' +
      '[02:42.55]Na na na na na na na na\n' +
      '[02:47.76]Na na na na na na na na\n' +
      '[02:52.99]Na na na na na na na na\n' +
      '[02:58.18]Na na na na na na na na\n' +
      '[03:03.41]Na na na na na na na na\n' +
      '[03:08.61]Na na na na na na na na\n' +
      '[03:13.85]我没有擦去争吵的橡皮\n' +
      '[03:19.06]只有一支画着孤独的笔\n' +
      '[03:24.27]那夜空的月也不再亮\n' +
      '[03:29.49]只有个忧郁的孩子在唱\n' +
      '[03:34.68]为寂寞的夜空画上一个月亮\n'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
    name: 'Sweet Dreams',
    author: 'TPaul Sax / Eurythmics',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
    id: '0016',
    lrc:'[ti:Sweet Dreams (Are Made of This)]\n' +
      '[ar:Eurythmics]\n' +
      '[al:Sweet Dreams (Are Made of This)]\n' +
      '[length:03:36]\n' +
      '\n' +
      '[00:17.88]Sweet dreams are made of this  \n' +
      '[00:24.88]Who am I to disagree?  \n' +
      '[00:31.88]I travel the world and the seven seas  \n' +
      '[00:38.88]Everybody\'s looking for something  \n' +
      '\n' +
      '[00:45.88]Some of them want to use you  \n' +
      '[00:49.38]Some of them want to get used by you  \n' +
      '[00:52.88]Some of them want to abuse you  \n' +
      '[00:56.38]Some of them want to be abused  \n' +
      '\n' +
      '[00:59.88]Sweet dreams are made of this  \n' +
      '[01:06.88]Who am I to disagree?  \n' +
      '[01:13.88]I travel the world and the seven seas  \n' +
      '[01:20.88]Everybody\'s looking for something  \n' +
      '\n' +
      '[01:27.88]Hold your head up, movin\' on  \n' +
      '[01:30.88]Keep your head up, movin\' on  \n' +
      '[01:33.88]Hold your head up, movin\' on  \n' +
      '[01:36.88]Keep your head up, movin\' on  \n' +
      '\n' +
      '[01:39.88]Some of them want to use you  \n' +
      '[01:43.38]Some of them want to get used by you  \n' +
      '[01:46.88]Some of them want to abuse you  \n' +
      '[01:50.38]Some of them want to be abused  \n' +
      '\n' +
      '[01:53.88]Sweet dreams are made of this  \n' +
      '[02:00.88]Who am I to disagree?  \n' +
      '[02:07.88]I travel the world and the seven seas  \n' +
      '[02:14.88]Everybody\'s looking for something  \n' +
      '\n' +
      '[02:21.88]Sweet dreams are made of this  \n' +
      '[02:28.88]Who am I to disagree?  \n' +
      '[02:35.88]I travel the world and the seven seas  \n' +
      '[02:42.88]Everybody\'s looking for something  \n' +
      '\n' +
      '[02:49.88]Sweet dreams are made of this  \n' +
      '[02:56.88]Who am I to disagree?  \n' +
      '[03:03.88]I travel the world and the seven seas  \n' +
      '[03:10.88]Everybody\'s looking for something  \n'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
    name: '奢香夫人',
    author: '凤凰传奇',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
    id: '0017',
    lrc:'[ti:奢香夫人]\n' +
      '[ar:凤凰传奇]\n' +
      '[al:最炫民族风]\n' +
      '[length:04:19]\n' +
      '\n' +
      '[00:24.80]落脚河上面崖对崖\n' +
      '[00:27.60]威宁草海荞花盛开\n' +
      '[00:30.40]谁把月亮挂天上\n' +
      '[00:33.20]照得想说的话 流成海\n' +
      '\n' +
      '[00:36.00]越过绵绵的高山 越过无尽的沧海\n' +
      '[00:42.80]如果期待依然在 总是春暖到花开\n' +
      '[00:49.60]请你轻轻留下来 让梦卷走这尘埃\n' +
      '[00:56.40]香飘在书厢之外 奏响美丽的天籁\n' +
      '\n' +
      '[01:03.20]不等三更过天晓白\n' +
      '[01:06.00]奢香夫人赶月归来\n' +
      '[01:08.80]她把日光画心上\n' +
      '[01:11.60]照得漆黑的夜 亮堂堂\n' +
      '\n' +
      '[01:14.40]越过绵绵的高山 越过无尽的沧海\n' +
      '[01:21.20]如果期待依然在 总是春暖到花开\n' +
      '[01:28.00]请你轻轻留下来 让梦卷走这尘埃\n' +
      '[01:34.80]香飘在书厢之外 奏响美丽的天籁\n' +
      '\n' +
      '[01:41.60]乌蒙山连着山外山\n' +
      '[01:44.40]月光洒下了响水滩\n' +
      '[01:47.20]有没有人能告诉我\n' +
      '[01:50.00]可是苍天对你在呼唤\n' +
      '\n' +
      '[01:52.80]一座山翻过一条河\n' +
      '[01:55.60]千山万水永不寂寞\n' +
      '[01:58.40]你来过年华被传说\n' +
      '[02:01.20]百里杜鹃不凋落\n' +
      '\n' +
      '[02:04.00]乌蒙山连着山外山\n' +
      '[02:06.80]月光洒下了响水滩\n' +
      '[02:09.60]有没有人能告诉我\n' +
      '[02:12.40]可是苍天对你在呼唤\n' +
      '\n' +
      '[02:15.20]一座山翻过一条河\n' +
      '[02:18.00]走过千山万水永不寂寞\n' +
      '[02:20.80]你来过年华被传说\n' +
      '[02:23.60]百里杜鹃不凋落\n' +
      '\n' +
      '[02:26.40]怀念总在心头绕\n' +
      '[02:29.20]我们记忆的凭吊\n' +
      '[02:32.00]善良的心跳\n' +
      '\n' +
      '[02:34.80]我寻着你的路 让风都停住\n' +
      '[02:37.60]依然清晰看见你那坚强的脚步\n' +
      '[02:40.40]如果天留得住 如果地也能把你挽住\n' +
      '[02:43.20]愿你就在这片云水间常驻\n' +
      '\n' +
      '[02:46.00]乌蒙山连着山外山\n' +
      '[02:48.80]月光洒下了响水滩\n' +
      '[02:51.60]有没有人能告诉我\n' +
      '[02:54.40]可是苍天对你在呼唤\n' +
      '\n' +
      '[02:57.20]一座山翻过一条河\n' +
      '[03:00.00]千山万水永不寂寞\n' +
      '[03:02.80]你来过年华被传说\n' +
      '[03:05.60]百里杜鹃不凋落\n' +
      '\n' +
      '[03:08.40]乌蒙山连着山外山\n' +
      '[03:11.20]月光洒下了响水滩\n' +
      '[03:14.00]有没有人能告诉我\n' +
      '[03:16.80]可是苍天对你在呼唤\n' +
      '\n' +
      '[03:19.60]一座山翻过一条河\n' +
      '[03:22.40]走过千山万水永不寂寞\n' +
      '[03:25.20]你来过年华被传说\n' +
      '[03:28.00]百里杜鹃不凋落\n'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
    name: '空心',
    author: '光泽',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
    id: '0018',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
    name: '反转地球',
    author: '潘玮柏',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
    id: '0019',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
    name: 'No.9',
    author: 'T-ara',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
    id: '0020',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
    name: '孤独',
    author: 'G.E.M.邓紫棋',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
    id: '0021',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
    name: 'Lose Control',
    author: 'Hedley',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
    id: '0022',
    lrc:'[00:00.00] Lose Control - Hedley\n' +
      '[00:02.00] Can I make a little toast\n' +
      '[00:04.00] Can we get a little close\n' +
      '[00:06.00] Can I get an amen\n' +
      '[00:08.00] Can I get a hell yeah\n' +
      '[00:10.00] Can I get a holy ghost\n' +
      '[00:12.00] Somebody give me a beat\n' +
      '[00:14.00] Let me see you on your feet\n' +
      '[00:16.00] Somebody say your man\n' +
      '[00:18.00] I don\'t give a goddamn\n' +
      '[00:20.00] I wanna be your freak\n' +
      '[00:22.00] Catch me if you can\n' +
      '[00:24.00] I don\'t think you understand where we\'re going\n' +
      '[00:26.00] Where we\'re going\n' +
      '[00:28.00] When you feel it and you know\n' +
      '[00:30.00] When this shit\'s about to blow\n' +
      '[00:32.00] And it hits you\n' +
      '[00:34.00] Ooh it hits you like\n' +
      '[00:36.00] In my body\n' +
      '[00:38.00] In my bones\n' +
      '[00:40.00] Drop the beat and free my soul\n' +
      '[00:42.00] When I hear that rock and roll\n' +
      '[00:44.00] Oh my God, I lose control\n' +
      '[00:46.00] La la la la, oh oh oh\n' +
      '[00:48.00] La la la la, oh oh oh\n' +
      '[00:50.00] I had to let it go\n' +
      '[00:52.00] Oh my God, I lose control\n' +
      '[00:54.00] In my body\n' +
      '[00:56.00] In my bones\n' +
      '[00:58.00] Drop the beat and free my soul\n' +
      '[01:00.00] When I hear that rock and roll\n' +
      '[01:02.00] Oh my God, I lose control\n' +
      '[01:04.00] La la la la, oh oh oh\n' +
      '[01:06.00] La la la la, oh oh oh\n' +
      '[01:08.00] I had to let it go\n' +
      '[01:10.00] Oh my God, I lose control\n' +
      '[01:12.00] Like a shot to the face\n' +
      '[01:14.00] Now you got a little taste\n' +
      '[01:16.00] Baby never give a fuck\n' +
      '[01:18.00] Get up\n' +
      '[01:20.00] Stand up\n' +
      '[01:22.00] Shake your buns to the bass\n' +
      '[01:24.00] When you break it down\n' +
      '[01:26.00] They\'re gonna love the sound\n' +
      '[01:28.00] Everybody just stop\n' +
      '[01:30.00] And bring it back around like\n' +
      '[01:32.00] Catch me if you can\n' +
      '[01:34.00] I don\'t think you understand where we\'re going\n' +
      '[01:36.00] Where we\'re going\n' +
      '[01:38.00] When you feel it and you know\n' +
      '[01:40.00] When this shit\'s about to blow\n' +
      '[01:42.00] And it hits you\n' +
      '[01:44.00] Ooh it hits you like\n' +
      '[01:46.00] In my body\n' +
      '[01:48.00] In my bones\n' +
      '[01:50.00] Drop the beat and free my soul\n' +
      '[01:52.00] When I hear that rock and roll\n' +
      '[01:54.00] Oh my God, I lose control\n' +
      '[01:56.00] La la la la, oh oh oh\n' +
      '[01:58.00] La la la la, oh oh oh\n' +
      '[02:00.00] I had to let it go\n' +
      '[02:02.00] Oh my God, I lose control\n' +
      '[02:04.00] Oh my God, I lose control\n' +
      '[02:06.00] Oh my God, I lose control\n' +
      '[02:08.00] Catch me if you can\n' +
      '[02:10.00] I don\'t think you understand where we\'re going\n' +
      '[02:12.00] When you feel it and you know\n' +
      '[02:14.00] When this shit\'s about to blow\n' +
      '[02:16.00] When it hits you\n' +
      '[02:18.00] Hits you like\n' +
      '[02:20.00] In my body\n' +
      '[02:22.00] In my bones\n' +
      '[02:24.00] Drop the beat and free my soul\n' +
      '[02:26.00] When I hear that rock and roll\n' +
      '[02:28.00] Oh my God, I lose control\n' +
      '[02:30.00] La la la la, oh oh oh\n' +
      '[02:32.00] La la la la, oh oh oh\n' +
      '[02:34.00] I had to let it go\n' +
      '[02:36.00] Oh my God, I lose control\n' +
      '[02:38.00] In my body\n' +
      '[02:40.00] In my bones\n' +
      '[02:42.00] Drop the beat and free my soul\n' +
      '[02:44.00] When I hear that rock and roll\n' +
      '[02:46.00] Oh my God, I lose control\n' +
      '[02:48.00] La la la la, oh oh oh\n' +
      '[02:50.00] La la la la, oh oh oh\n' +
      '[02:52.00] I had to let it go\n' +
      '[02:54.00] Oh my God, I lose control\n' +
      '[02:56.00] Oh my God, I lose control\n' +
      '[02:58.00] Oh my God, I lose control\n'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
    name: '倩女幽魂',
    author: '张国荣',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
    id: '0023',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
    name: '北京北京',
    author: '汪峰',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
    id: '0024',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
    name: '苦笑',
    author: '汪苏泷',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
    id: '0025',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
    name: '一生所爱',
    author: '卢冠廷 / 莫文蔚',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
    id: '0026',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
    name: '月半小夜曲',
    author: '李克勤',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
    id: '0027',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
    name: 'Rolling in the Deep',
    author: 'Adele',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
    id: '0028',
    lrc:''
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
    name: '海阔天空',
    author: 'Beyond',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
    id: '0029',
    lrc:''
  }
]