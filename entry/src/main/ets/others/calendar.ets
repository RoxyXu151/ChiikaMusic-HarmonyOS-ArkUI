import router from '@ohos.router';

@Entry
@Component
struct Calendars {
  @State currentMonth: string = 'February';
  @State currentYear: string = '2021';
  @State selectedDate: number = 3; // 默认选中日期
  @State currentView: string = 'Week'; // 当前视图模式：Day, Week, Month, Year
  @State currentWeekDates: number[] = [21, 22, 23, 24, 25, 26, 27]; // 当前周的日期
  @State searchText: string = ''; // 搜索文本
  @State isMenuCollapsed: boolean = false; // 控制左侧菜单是否收缩
  
  // 日历数据
  private daysOfWeek: string[] = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  private daysInMonth: number[] = [31, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28];
  
  // 事件数据示例
  private eventDots: Map<number, number[]> = new Map([
    [1, [0, 1, 2]], // 日期1有3个事件，颜色索引分别为0,1,2
    [2, [0, 1, 2]],
    [3, [0, 1, 2]],
    [4, [0, 1, 2]],
    [5, [0, 1, 2]]
  ]);
  
  // 事件颜色
  private eventColors: string[] = ['#FF5C00', '#0A84FF', '#30D158'];
  
  // 日程事件数据
  private events: Event[] = [
    { day: 22, startTime: '8:00 AM', endTime: '9:00 AM', title: 'Monday Wake-Up Hour', color: '#0A84FF' },
    { day: 22, startTime: '9:00 AM', endTime: '10:00 AM', title: 'All-Team Kickoff', color: '#0A84FF' },
    { day: 22, startTime: '10:00 AM', endTime: '11:00 AM', title: 'Financial Update', color: '#0A84FF' },
    { day: 22, startTime: '11:00 AM', endTime: '12:00 PM', title: 'New Employee Welcome Lunch!', color: '#BF5AF2', icon: '🍕' },
    { day: 22, startTime: '1:00 PM', endTime: '2:00 PM', title: 'Design Review', color: '#0A84FF' },
    { day: 22, startTime: '2:00 PM', endTime: '3:00 PM', title: '1:1 with Jon', color: '#FF9F0A' },
    
    { day: 23, startTime: '9:00 AM', endTime: '10:00 AM', title: 'Design Review: Acme Marketing', color: '#0A84FF' },
    { day: 23, startTime: '12:00 PM', endTime: '1:00 PM', title: 'Design System Kickoff Lunch', color: '#0A84FF', icon: '📐' },
    { day: 23, startTime: '2:00 PM', endTime: '3:00 PM', title: 'Concept Design Review II', color: '#0A84FF' },
    { day: 23, startTime: '4:00 PM', endTime: '5:00 PM', title: 'Design Team Happy Hour', color: '#FF2D55', icon: '🎨' },
    
    { day: 24, startTime: '9:00 AM', endTime: '10:00 AM', title: 'Webinar: Figma ...', color: '#30D158' },
    { day: 24, startTime: '1:00 PM', endTime: '2:00 PM', title: 'MVP Prioritization Workshop', color: '#0A84FF' },
    
    { day: 25, startTime: '9:00 AM', endTime: '10:00 AM', title: 'Coffee Chat', color: '#0A84FF', icon: '☕' },
    { day: 25, startTime: '10:00 AM', endTime: '11:00 AM', title: 'Health Benefits Walkthrough', color: '#BF5AF2' },
    { day: 25, startTime: '11:00 AM', endTime: '12:00 PM', title: 'Onboarding Presentation', color: '#BF5AF2' },
    
    { day: 26, startTime: '9:00 AM', endTime: '10:00 AM', title: 'Coffee Chat', color: '#0A84FF', icon: '☕' },
    { day: 26, startTime: '12:00 PM', endTime: '1:00 PM', title: 'Marketing Meet-and-Greet', color: '#0A84FF', icon: '💬' },
    { day: 26, startTime: '1:00 PM', endTime: '2:00 PM', title: 'Design Review', color: '#0A84FF' },
    { day: 26, startTime: '2:00 PM', endTime: '3:00 PM', title: '1:1 with Heather', color: '#FF9F0A' },
    { day: 26, startTime: '4:00 PM', endTime: '5:00 PM', title: 'Happy Hour', color: '#FF2D55', icon: '🥂' }
  ];
  
  // 时间段
  private timeSlots: string[] = [
    '7 AM', '8 AM', '9 AM', '10 AM', '11 AM', '12 PM',
    '1 PM', '2 PM', '3 PM', '4 PM', '5 PM'
  ];
  
  // 获取指定日期的事件
  private getEventsForDay(day: number) {
    return this.events.filter(event => event.day === day);
  }
  
  // 获取事件在时间表中的位置
  private getEventPosition(startTime: string): number {
    const hour = parseInt(startTime.split(':')[0]);
    const ampm = startTime.includes('AM') ? 'AM' : 'PM';
    let position = this.timeSlots.findIndex(slot => slot === `${hour} ${ampm}`);
    return position >= 0 ? position : 0;
  }
  
  build() {
    Column() {
      Row() {
        // 左侧菜单
        Stack({ alignContent: Alignment.TopEnd }) {
          Column() {
            // 顶部菜单
            Row() {
              // 彩色圆点
              Row() {
                Circle({ width: 6, height: 6 })
                  .fill('#FF5C00')
                  .stroke('#FFFFFF')
                  .strokeWidth(0.5)
                  .margin({ right: 6 })
                
                Circle({ width: 6, height: 6 })
                  .fill('#0A84FF')
                  .stroke('#FFFFFF')
                  .strokeWidth(0.5)
                  .margin({ right: 6 })
                
                Circle({ width: 6, height: 6 })
                  .fill('#30D158')
                  .stroke('#FFFFFF')
                  .strokeWidth(0.5)
              }
              .width(80)
              .justifyContent(FlexAlign.Start)
              
              // 菜单图标
              Image($r('app.media.menu_icon'))
                .width(12)
                .height(12)
                .margin({ left: 'auto' })
            }
            .width(160)
            .padding({ top: 12, bottom: 12, left: 10, right: 10 })
            
            if (!this.isMenuCollapsed) {
              // 日期选择器
              Column() {
                Row() {
                  Text(this.currentMonth)
                    .fontSize(11)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#000000')
                  
                  Text(this.currentYear)
                    .fontSize(11)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#8E8E93')
                    .margin({ left: 6 })
                }
                .width(160)
                
                Row() {
                  Image($r('app.media.chevron_left'))
                    .width(12)
                    .height(12)
                    .onClick(() => {
                      // 上个月逻辑
                    })
                  
                  Image($r('app.media.chevron_right'))
                    .width(12)
                    .height(12)
                    .onClick(() => {
                      // 下个月逻辑
                    })
                }
                .width(160)
                .justifyContent(FlexAlign.End)
                .margin({ top: 6 })
              }
              .width(160)
              .padding({ left: 10, right: 10, bottom: 10 })
              
              // 迷你日历
              Column() {
                // 星期标题
                Row() {
                  ForEach(this.daysOfWeek, (day: string) => {
                    Text(day)
                      .fontSize(6)
                      .fontWeight(FontWeight.Medium)
                      .fontColor('#8E8E93')
                      .width(20)
                      .textAlign(TextAlign.Center)
                  })
                }
                .width(160)
                .padding({ top: 6, bottom: 6 })
                
                // 日期网格
                Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
                  ForEach(this.daysInMonth, (day: number, index: number) => {
                    Column() {
                      Text(day.toString())
                        .fontSize(8)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(day === this.selectedDate ? '#007AFF' : '#000000')
                        .width(14)
                        .height(14)
                        .textAlign(TextAlign.Center)
                      
                      // 事件指示点
                      if (this.eventDots.has(day)) {
                        Row() {
                          ForEach(this.eventDots.get(day), (colorIndex: number) => {
                            Circle({ width: 2.5, height: 2.5 })
                              .fill(this.eventColors[colorIndex])
                              .margin({ right: 1.5 })
                          })
                        }
                        .height(2.5)
                        .margin({ top: 3 })
                      }
                    }
                    .width(20)
                    .height(24)
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Center)
                    .onClick(() => {
                      this.selectedDate = day;
                    })
                  })
                }
                .width(160)
              }
              .width(160)
              .padding({ left: 10, right: 10 })
            }
          }
          .width(this.isMenuCollapsed ? 30 : 160)
          .height(600)
          .backgroundColor('#F2F2F7')
          
          // 收缩按钮
          Button({
            type: ButtonType.Circle,
            stateEffect: true
          }) {
            Image(this.isMenuCollapsed ? $r('app.media.chevron_right') : $r('app.media.chevron_left'))
              .width(8)
              .height(8)
              .fillColor('#000000')
          }
          .width(16)
          .height(16)
          .backgroundColor('#FFFFFF')
          .margin({ top: 40, right: -8 })
          .onClick(() => {
            this.isMenuCollapsed = !this.isMenuCollapsed;
          })
        }
        
        // 右侧主日历区域
        Column() {
          // 顶部导航栏
          Row() {
            // 左侧导航按钮
            Row() {
              // 今天按钮
              Button('Today')
                .fontSize(7)
                .fontWeight(FontWeight.Medium)
                .backgroundColor('#FFFFFF')
                .fontColor('#000000')
                .borderRadius(3)
                .height(18)
                .padding({ left: 8, right: 8 })
              
              // 前后导航箭头
              Row() {
                Image($r('app.media.chevron_left'))
                  .width(12)
                  .height(12)
                  .margin({ right: 10 })
                
                Image($r('app.media.chevron_right'))
                  .width(12)
                  .height(12)
              }
              .margin({ left: 10 })
            }
            
            // 中间视图选择器
            Row() {
              ForEach(['Day', 'Week', 'Month', 'Year'], (view: string) => {
                Text(view)
                  .fontSize(7)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.currentView === view ? '#FFFFFF' : '#000000')
                  .backgroundColor(this.currentView === view ? '#E5484D' : '#FFFFFF')
                  .borderRadius(3)
                  .height(18)
                  .padding({ left: 8, right: 8 })
                  .textAlign(TextAlign.Center)
                  .margin({ right: view !== 'Year' ? 4 : 0 })
                  .onClick(() => {
                    this.currentView = view;
                  })
              })
            }
            .justifyContent(FlexAlign.Center)
            
            // 右侧搜索框
            Search({ placeholder: 'Search', value: this.searchText })
              .width(100)
              .height(18)
              .backgroundColor('#F2F2F7')
              .borderRadius(4)
              .onChange((value: string) => {
                this.searchText = value;
              })
          }
          .width(400)
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ top: 10, bottom: 10, left: 10, right: 10 })
          
          // 周视图
          Column() {
            // 星期和日期标题
            Row() {
              // 时区信息
              Column() {
                Text('EST')
                  .fontSize(6)
                  .fontColor('#8E8E93')
                  .textAlign(TextAlign.End)
                
                Text('GMT-5')
                  .fontSize(6)
                  .fontColor('#8E8E93')
                  .textAlign(TextAlign.End)
              }
              .width(32)
              .alignItems(HorizontalAlign.End)
              .padding({ right: 6 })
              
              // 星期和日期
              ForEach(this.daysOfWeek, (day: string, index: number) => {
                Column() {
                  Text(day)
                    .fontSize(6)
                    .fontColor('#8E8E93')
                    .textAlign(TextAlign.Center)
                  
                  Text(this.currentWeekDates[index].toString())
                    .fontSize(12)
                    .fontWeight(FontWeight.Bold)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 2 })
                }
                .width(52)
                .padding({ top: 6, bottom: 6 })
                .backgroundColor(index === 4 ? '#F2F2F7' : '#FFFFFF') // 高亮当前日期
              })
            }
            .width(400)
            
            // 时间表格
            List() {
              ForEach(this.timeSlots, (time: string, timeIndex: number) => {
                ListItem() {
                  Row() {
                    // 时间标签
                    Text(time)
                      .fontSize(6)
                      .fontColor('#8E8E93')
                      .width(32)
                      .textAlign(TextAlign.End)
                      .padding({ right: 6 })
                    
                    // 时间格子
                    Row() {
                      ForEach(this.currentWeekDates, (day: number, dayIndex: number) => {
                        Stack({ alignContent: Alignment.TopStart }) {
                          // 背景
                          Column()
                            .width(52)
                            .height(45)
                            .backgroundColor(dayIndex === 4 ? '#F2F2F7' : '#FFFFFF') // 高亮当前日期列
                            .border({ width: { top: 0.5, right: 0.5 }, color: '#E5E5EA', style: BorderStyle.Solid })
                          
                          // 事件
                          ForEach(this.getEventsForDay(day), (event: Event) => {
                            if (this.getEventPosition(event.startTime) === timeIndex) {
                              Column() {
                                Row() {
                                  // 事件图标
                                  if (event.icon) {
                                    Text(event.icon)
                                      .fontSize(7)
                                      .margin({ right: 3 })
                                  }
                                  
                                  // 事件时间
                                  Text(event.startTime)
                                    .fontSize(6)
                                    .fontColor('#FFFFFF')
                                    .fontWeight(FontWeight.Medium)
                                  
                                  if (event.icon) {
                                    Text(' ')
                                      .fontSize(6)
                                  }
                                }
                                .width(46)
                                
                                // 事件标题
                                Text(event.title)
                                  .fontSize(7)
                                  .fontColor('#FFFFFF')
                                  .fontWeight(FontWeight.Medium)
                                  .margin({ top: 3 })
                              }
                              .width(46)
                              .padding(5)
                              .backgroundColor(event.color)
                              .borderRadius(4)
                              .margin({ top: 3, bottom: 3 })
                            }
                          })
                        }
                        .width(52)
                        .height(45)
                      })
                    }
                    .width(368)
                    .height(45)
                  }
                  .width(400)
                }
                .width(400)
              })
            }
            .width(400)
            .height(510)
          }
          .width(400)
          .height(600)
        }
        .width(400)
        .height(600)
        .backgroundColor('#FFFFFF')
      }
      .width(560)
      .height(600)
    }
    .width(560)
    .height(600)
  }
}

interface Event {
  day: number,
  startTime: string,
  endTime: string,
  title: string,
  description?: string,
  color: string,
  icon?: string
}