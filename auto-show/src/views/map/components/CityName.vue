<template>
  <div>
    <!-- 点击后去城市列表页面 -->
    <div>
      <!-- 定位图标 -->
      <img src="~assets/img/navigation/location.svg" alt="" />
      <!-- 城市名 -->
      <span id="cityName">{{ $store.state.cityName }}</span>
    </div>
    <div id="container" style="width: 0vw; height: 0vh"></div>
  </div>
</template>

<script>
// 公共组件
import Navbar from "components/navBar/NavBar.vue";
// 项目相关的
import Navigation from "views/navigation/Navigation";

//map

import AMapLoader from "@amap/amap-jsapi-loader";

// event bus
// import bus from "@/bus";
// 网络请求
export default {
  name: "Home",
  data() {
    return {};
  },
  components: {
    Navbar,
    Navigation,
  },
  mounted() {
    let that = this;
    window._AMapSecurityConfig = {
      securityJsCode: "c1cf29f83565d49c955ba52ae49fed7d",
    };
    AMapLoader.load({
      city: "郑州",
      key: "ff9a906ad237273b15d6a341b8b004e1", // 申请好的Web端开发者Key，首次调用 load 时必填
      version: "1.4.15", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
      plugins: ["AMap.CitySearch"], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      AMapUI: {
        // 是否加载 AMapUI，缺省不加载
        version: "1.1", // AMapUI 缺省 1.1
        plugins: [], // 需要加载的 AMapUI ui插件
      },
      Loca: {
        // 是否加载 Loca， 缺省不加载
        version: "1.3.2", // Loca 版本，缺省 1.3.2
      },
    })
      .then((AMap) => {
        // 根据 ip 地址自动获取城市信息
        AMap.plugin("AMap.CitySearch", function () {
          var citySearch = new AMap.CitySearch();
          citySearch.getLocalCity(function (status, result) {
            // console.log(status);
            if (status == "complete" && result.info === "OK") {
              // 查询成功，result即为当前所在城市信息
              // console.log(result, '成功');
              that.$store.commit("setCityName", result.city.slice(0, 2));
            } else if (status == "error") {
              console.log(result, "失败");
            }
          });
        });
      })
      .catch((e) => {
        console.log(e);
      });
  },
};
</script>

<style>
@import url("~assets/css/normalize.css");
.navItem {
  font-size: 18px;
}
.navItem img {
  font-size: 0;
  margin-top: 3px;
  width: 20px;
  height: 20px;
  vertical-align: middle;
  margin-bottom: 2px;
  /* display: block; */
}
</style>
