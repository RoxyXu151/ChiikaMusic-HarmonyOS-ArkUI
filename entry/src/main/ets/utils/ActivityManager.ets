import { sensor } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common,UIAbility,bundleManager, Permissions } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
const permissions: Array<Permissions> = ['ohos.permission.LOCATION','ohos.permission.ACTIVITY_MOTION'];
class ActivityManager {

  async checkPermissions(context: common.UIAbilityContext): Promise<void> {
    let stepStatus: boolean = await this.checkPermissionGrant('ohos.permission.ACTIVITY_MOTION') ===
    abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED; // 获取运动传感器权限
    console.debug("[ChiikaMusic]:未获得ACTIVITY_MOTION权限")
    if(!stepStatus){
      console.debug("[ChiikaMusic]:尝试申请ACTIVITY_MOTION权限")
      this.reqPermissionsFromUser(permissions, context);
    }
  }

  async checkPermissionGrant(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let grantStatus: abilityAccessCtrl.GrantStatus = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;


    // 获取应用程序的accessTokenID。
    let tokenId: number = 0;
    try {
      let bundleInfo: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      tokenId = appInfo.accessTokenId;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      console.error(`Failed to get bundle info for self. Code is ${err.code}, message is ${err.message}`);
    }

    // 校验应用是否被授予权限。
    try {
      grantStatus = await atManager.checkAccessToken(tokenId, permission);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      console.error(`Failed to check access token. Code is ${err.code}, message is ${err.message}`);
    }

    return grantStatus;
  }

  reqPermissionsFromUser(permissions: Array<Permissions>, context: common.UIAbilityContext): void {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(context, permissions).then((data) => {
      let grantStatus: Array<number> = data.authResults;
      let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }
      // 授权成功
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }



  getSensorList() {
    sensor.getSensorList((error: BusinessError, data: Array<sensor.Sensor>) => {
      if (error) {
        console.info('getSensorList failed');
      } else {
        console.info('getSensorList success');
        for (let i = 0; i < data.length; i++) {
          console.info(JSON.stringify(data[i]));
        }
      }
    });
  }

  on() {
    sensor.on(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
      console.info("Succeeded in obtaining data. x: " + data.x + " y: " + data.y + " z: " + data.z);
    }, { interval: 100000000 });
  }

  once() {
    sensor.once(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
      console.info("Succeeded in obtaining data. x: " + data.x + " y: " + data.y + " z: " + data.z);
    });
  }

  off() {
    sensor.off(sensor.SensorId.ACCELEROMETER);
  }
}

export const activityManager:ActivityManager=new ActivityManager()