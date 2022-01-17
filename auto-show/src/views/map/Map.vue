<template>
  <div>
    <Navbar class="navbar">
      <template #left>
        <!-- 点击后去城市列表页面 -->
        <div @click="change_city">
          <!-- 定位图标 -->
          <img src="~assets/img/navigation/search.svg" alt="" />
          <!-- 城市名 -->
          <span id="cityName" style="display: none"></span>
        </div>
      </template>
      <template #center>
        <!-- 所搜框 -->
        <input type="text" placeholder="郑州国际会展中心" v-model="search_value" id="input" />
      </template>
    </Navbar>
    <div id="container" style="width: 100vw; height: 90vh"></div>
    <van-tabbar class="my_footer" v-model="active">
      <router-link to="/">
        <van-tabbar-item name="home" icon="wap-home">主页</van-tabbar-item>
      </router-link>
      <router-link to="/map">
        <van-tabbar-item name="location" icon="location">地图</van-tabbar-item>
      </router-link>
      <router-link to="/news">
        <van-tabbar-item name="more" icon="more">车友圈</van-tabbar-item>
      </router-link>
      <router-link to="/me">
        <van-tabbar-item name="manager" icon="manager">我的</van-tabbar-item>
      </router-link>
    </van-tabbar>
  </div>
</template>

<script>
// 公共组件
import Navbar from 'components/navBar/NavBar.vue';

//map
import AMapLoader from '@amap/amap-jsapi-loader';

// event bus
// import bus from "@/bus";
// 网络请求
export default {
  name: 'Home',
  data() {
    return {
      active: 'location',
      search_value: '',
      shops: {},
    };
  },
  components: {
    Navbar,
  },
  mounted() {
    window._AMapSecurityConfig = {
      securityJsCode: 'c1cf29f83565d49c955ba52ae49fed7d',
    };
    AMapLoader.load({
      city: '郑州',
      key: 'ff9a906ad237273b15d6a341b8b004e1', // 申请好的Web端开发者Key，首次调用 load 时必填
      version: '1.4.15', // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
      plugins: ['AMap.Scale', 'AMap.Geolocation', 'AMap.ToolBar', 'AMap.Autocomplete', 'AMap.CitySearch'], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
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
        // 创建地图实例
        var map = new AMap.Map('container', {
          center: [113.728952, 34.772596],
          zoom: 15,
        });
        // 添加控件
        // 添加比例尺控件
        let scale = new AMap.Scale({
          visible: true,
        });
        // 根据 ip 地址自动获取城市信息
        AMap.plugin('AMap.CitySearch', function () {
          var citySearch = new AMap.CitySearch();
          citySearch.getLocalCity(function (status, result) {
            // console.log(status);
            if (status == 'complete' && result.info === 'OK') {
              // 查询成功，result即为当前所在城市信息
              // console.log(result);
              let cityName = document.querySelector('#cityName');
              cityName.innerText = result.city.slice(0, 2);
              // this.city = result.city.slice(0, 2);
            } else if (status == 'error') {
              console.log(result);
            }
          });
        });
        // 添加工具条控件
        let toolBar = new AMap.ToolBar();
        map.addControl(scale);
        map.addControl(toolBar);

        AMap.plugin(['AMap.Autocomplete', 'AMap.PlaceSearch'], function () {
          var autoOptions = {
            // 城市，默认全国
            city: '郑州',
            // 使用联想输入的input的id
            input: 'input',
          };
          var autocomplete = new AMap.Autocomplete(autoOptions);
          var placeSearch = new AMap.PlaceSearch({
            city: '郑州',
            map: map,
            extensions: 'all',
          });
          AMap.event.addListener(autocomplete, 'select', function (e) {
            //TODO 针对选中的poi实现自己的功能
            // console.log(e);
            placeSearch.search(e.poi.name);
          });
        });
        // 添加定位控件
        // map.plugin('AMap.Geolocation', function () {
        //   let geolocation = new AMap.Geolocation({
        //     enableHighAccuracy: true, //是否使用高精度定位，默认:true
        //     timeout: 10000, //超过10秒后停止定位，默认：无穷大
        //     maximumAge: 0, //定位结果缓存0毫秒，默认：0
        //     convert: true, //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
        //     showButton: true, //显示定位按钮，默认：true
        //     buttonPosition: 'LB', //定位按钮停靠位置，默认：'LB'，左下角
        //     buttonOffset: new AMap.Pixel(10, 45), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
        //     showMarker: true, //定位成功后在定位到的位置显示点标记，默认：true
        //     markerOptions: true, //定位点Marker的配置，不设置该属性则使用默认Marker样式
        //     showCircle: false, //定位成功后用圆圈表示定位精度范围，默认：true
        //     panToLocation: true, //定位成功后将定位到的位置作为地图中心点，默认：true
        //     zoomToAccuracy: false, //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
        //     extensions: 'all', // JSAPI在定位成功的时候会将得到的经纬度进行逆地理编码后获取地址信息
        //   });
        //   map.addControl(geolocation);
        //   geolocation.getCurrentPosition();
        //   AMap.event.addListener(geolocation, 'complete', onComplete); //返回定位信息
        //   AMap.event.addListener(geolocation, 'error', onError); //返回定位出错信息
        // });
        // function onComplete(data) {
        //   // console.log(data);
        //   let lat = data.position.lat;
        //   let lng = data.position.lng;
        //   // 根据关键词提示

        // }
        // function onError(err) {
        //   console.log(err);
        // }
      })
      .catch(e => {
        console.log(e);
      });
  },
};
</script>

<style scoped>
@import url('~assets/css/normalize.css');
.navBar {
  margin: 0 auto;
  width: 90%;
  border-radius: 25px;
  font-size: 18px;
  box-shadow: 0.3rem 0.3rem 0.5rem #ccc !important;

  position: fixed;
  top: 1rem;
  left: 0;
  right: 0;
  z-index: 1;
  background-color: #fff;
}
.navBar img {
  margin-top: 3px;
  width: 20px !important;
  height: 20px !important;
  vertical-align: sub;
  margin-bottom: 2px;
}

.left {
  width: 3rem !important;
}
.left img {
  width: 1.8rem;
  height: 2.4rem;
  padding: 0 0 0 0.8rem;
}

#input {
  border: none;
  outline: none;
  background-color: #fff;
  /* padding: 5px; */
  border-radius: 0.3rem;
  width: 80vw;
  overflow: hidden;
}
/* 页脚 */
.my_footer {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
</style>
