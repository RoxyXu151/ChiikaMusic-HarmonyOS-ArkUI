import { common } from '@kit.AbilityKit'
import { sensor } from '@kit.SensorServiceKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { activityManager } from '../utils/ActivityManager'

@ObservedV2
export class GlobalHealthData{
  @Trace initCount:number=-1
  @Trace stepCount: number = 0 // 步数
  @Trace calories: number = 0 // 卡路里
  @Trace exerciseTime: number = 0 // 运动时间
  @Trace stepGoal: number = 10000 // 运动目标
  @Trace isExercising: boolean = false // 是否正在运动
  @Trace stepUpdateTimer: number = -1 // 步数更新定时器，-1 表示未启动

  // 使用真实传感器统计步数
  async startStepCounter() {
    console.debug(`[ChiikaMusic]:启动运动模式, stepCount=${this.stepCount}`)
    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    activityManager.checkPermissions(context)
    try {
      // 订阅计步器传感器
      sensor.on(sensor.SensorId.PEDOMETER, (data: sensor.PedometerResponse) => {
        if(this.initCount==-1) this.initCount=data.steps-this.stepCount
        this.stepCount = data.steps-this.initCount;// 步数
        this.calories = Math.round(this.stepCount * 0.05); // 卡路里
      }, { interval: 100000000 });

      this.isExercising = true;

      // 计时器更新运动时间
      this.stepUpdateTimer=setInterval(() => {
        if (this.isExercising) {
          this.exerciseTime += 1;
        }
      }, 1000);

      console.info('[ChiikaMusic]:步数传感器已启动');
    } catch (error) {
      const e = error as BusinessError;
      console.error(`[ChiikaMusic]:计步器订阅失败: Code=${e.code}, Message=${e.message}`);
    }
  }

  stopStepCounter() {
    this.isExercising = false;
    // 取消订阅传感器
    try {
      sensor.off(sensor.SensorId.PEDOMETER);
      this.initCount=-1
      console.info(`[ChiikaMusic]:步数传感器已停止. stepCount=${this.stepCount}`);
      //停止计数器
      clearInterval(this.stepUpdateTimer);
    } catch (error) {
      const e = error as BusinessError;
      console.error(`[ChiikaMusic]:计步器取消订阅失败: Code=${e.code}, Message=${e.message}`);
    }
  }

}