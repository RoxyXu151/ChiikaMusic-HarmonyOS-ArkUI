import { sensor } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';

class ActivityManager{


  getSensorList(){
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

  on(){
    sensor.on(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
      console.info("Succeeded in obtaining data. x: " + data.x + " y: " + data.y + " z: " + data.z);
    }, { interval: 100000000 });
  }

  once(){
    sensor.once(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
      console.info("Succeeded in obtaining data. x: " + data.x + " y: " + data.y + " z: " + data.z);
    });
  }
  off(){
    sensor.off(sensor.SensorId.ACCELEROMETER);
  }

}