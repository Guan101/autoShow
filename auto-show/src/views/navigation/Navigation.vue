<template>
  <div>
    <van-nav-bar fixed title="为您导航" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <div id="container" style="width: 100vw; height: 91vh; margin-top: 8vh"></div>
    <div id="panels"></div>
  </div>
</template>

<script>
//map
import AMapLoader from '@amap/amap-jsapi-loader';
export default {
  data() {
    return {
      key: '郑州',
    };
  },
  mounted() {
    window._AMapSecurityConfig = {
      securityJsCode: 'c1cf29f83565d49c955ba52ae49fed7d',
    };
    AMapLoader.load({
      city: '郑州',
      key: 'ff9a906ad237273b15d6a341b8b004e1', // 申请好的Web端开发者Key，首次调用 load 时必填
      version: '1.4.15', // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
      plugins: [], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      AMapUI: {
        // 是否加载 AMapUI，缺省不加载
        version: '1.1', // AMapUI 缺省 1.1
        plugins: [], // 需要加载的 AMapUI ui插件
      },
      Loca: {
        // 是否加载 Loca， 缺省不加载
        version: '1.3.2', // Loca 版本，缺省 1.3.2
      },
    })
      .then(AMap => {
        let that = this;
        // 创建地图实例
        var map = new AMap.Map('container', {
          center: [113.665745, 34.769492],
          zoom: 15,
        });
        map.plugin('AMap.Geolocation', function () {
          let geolocation = new AMap.Geolocation({
            enableHighAccuracy: true, //是否使用高精度定位，默认:true
            timeout: 1000, //超过10秒后停止定位，默认：无穷大
            maximumAge: 0, //定位结果缓存0毫秒，默认：0
            convert: true, //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
            showButton: true, //显示定位按钮，默认：true
            buttonPosition: 'LB', //定位按钮停靠位置，默认：'LB'，左下角
            buttonOffset: new AMap.Pixel(10, 45), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            showMarker: true, //定位成功后在定位到的位置显示点标记，默认：true
            markerOptions: true, //定位点Marker的配置，不设置该属性则使用默认Marker样式
            showCircle: false, //定位成功后用圆圈表示定位精度范围，默认：true
            panToLocation: true, //定位成功后将定位到的位置作为地图中心点，默认：true
            zoomToAccuracy: false, //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
            extensions: 'all', // JSAPI在定位成功的时候会将得到的经纬度进行逆地理编码后获取地址信息
          });
          geolocation.getCurrentPosition();
          AMap.event.addListener(geolocation, 'complete', onComplete); //返回定位信息
        });
        function onComplete(data) {
          // console.log(data);
          // console.log(data.formattedAddress);
          let origin = data.formattedAddress;
          AMap.plugin('AMap.Driving', function () {
            var driving = new AMap.Driving({
              // 驾车路线规划策略，AMap.DrivingPolicy.LEAST_TIME是最快捷模式
              size: 1,
              policy: AMap.DrivingPolicy.LEAST_TIME,
              map: map,
              isOutline: false,
              outlineColor: 'pink',
              autoFitView: true,
            });
            var points = [
              { keyword: origin, city: that.$store.state.cityName },
              {
                keyword: that.$route.query.address,
                city: that.$store.state.cityName,
              },
            ];
            // console.log(that.$route.query.address);
            driving.search(points, function (status, result) {
              // 未出错时，result即是对应的路线规划方案
              // console.log(result);
              // console.log(result.routes[0].distance / 1000 + "公里");
              let distance = result.routes[0].distance / 1000;
              let time = Math.floor(result.routes[0].time / 60);
              let destinationName = result.destinationName;
              // console.log(Math.floor(result.routes[0].time / 60) + "分");
              panels.innerHTML = `<h4>目的地: ${destinationName}</h4><h5>距你 ${distance.toFixed(
                1
              )} 公里</h5><h5>驾车 ${time} 分钟<h6>`;
            });
          });
        }
      })
      .catch(e => {
        console.log(e);
      });
  },
};
</script>

<style>
#panels {
  position: fixed;
  top: 8vh;
  right: 1rem;
  background-color: #fff;
  text-align: center;
  border-radius: 1rem;
  padding: 0 1rem;
  box-shadow: 0 0.2rem 0.5rem #ccc;
}
</style>
