<template>
  <div>
    <nav-bar class="navItem">
      <template #left> <city-name></city-name> </template>
      <template #center>
        <div>双十二车展</div>
      </template>
    </nav-bar>
    <!-- 轮播图 -->
    <n-carousel style="margin-top: 47px" trigger="hover" autoplay>
      <img
        class="carousel-img"
        src="https://img.pcauto.com.cn/images/upload/upc/tx/auto5/2007/24/c39/222230068_1595578307859_1024.jpg"
      />
      <img
        class="carousel-img"
        src="https://img.pcauto.com.cn/images/upload/upc/tx/auto5/2007/24/c73/222259545_1595588272690_1024.jpg"
      />
      <img
        class="carousel-img"
        src="https://img.pcauto.com.cn/images/upload/upc/tx/auto5/2007/24/c6/222170170_1595557862268_1024.jpg"
      />
      <img
        class="carousel-img"
        src="https://img.pcauto.com.cn/images/upload/upc/tx/auto5/2007/25/c3/222389619_1595663945651_1024.jpg"
      />
    </n-carousel>
    <!-- 导航 -->
    <ul class="iconList">
      <li>
        <router-link to="/barand">
          <Icon size="40" color="white">
            <CarSport />
          </Icon>
        </router-link>
        <span>品牌导航</span>
      </li>
      <li>
        <div @click="toPoints">
          <router-link to="">
            <Icon size="40" color="white">
              <Calendar />
            </Icon>
          </router-link>
        </div>
        <span>积分商城</span>
      </li>
      <li>
        <router-link to="/activity">
          <Icon size="40" color="white">
            <Gift />
          </Icon>
        </router-link>
        <span>同期活动</span>
      </li>
      <li>
        <router-link to="/scene">
          <Icon size="40" color="white">
            <Ticket />
          </Icon>
        </router-link>
        <span>现场门票</span>
      </li>
    </ul>
    <n-tag style="width: 100vw; margin: 10px 0; margin-top: 20px" type="success">
      <van-icon name="bullhorn-o" /> 不负“豫”见 2021第14届郑州国际车展圆满落幕
    </n-tag>
    <!-- 小轮播图 -->
    <div style="display: flex; flex-direction: row">
      <van-swipe v-if="swiperPic" :show-indicators="ccc" duration="0" class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(item, index) in swiperPic.data" :key="index">
          <router-link :to="`/activityDetails?num=${index}`">
            <img :src="item.a_pic" alt="" />
          </router-link>
        </van-swipe-item>
      </van-swipe>
      <van-swipe v-if="swiperNews" :show-indicators="ccc" duration="0" class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="(item, index) in swiperNews.data" :key="index">
          <router-link :to="`/newsDetails?num=${index}`">
            <img :src="item.n_pic" alt="" />
          </router-link>
        </van-swipe-item>
      </van-swipe>
    </div>
    <!-- 参展品牌滚动 -->
    <n-tag style="width: 100vw; margin-top: 5px" type="warning">3D看车</n-tag>
    <div v-if="carList" class="logoWarpper" style="margin-bottom: 70px; margin-top: 5px">
      <div class="logoList" :style="[{ width: this.logoWidth + 'px' }]">
        <div v-for="item in carList" :key="item.b_id">
          <!-- <router-link :to="{ path: `/carDetails`, query: { id: item.b_id } }"> -->
          <router-link :to="{ path: `/${item.b_name}` }">
            <img :src="item.b_logo" alt="" />
          </router-link>
        </div>
      </div>
    </div>
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
<script setup>
import { NCarousel } from 'naive-ui';
import NavBar from '../components/NavBar.vue';
</script>
<script>
// 引入axios
import CityName from 'views/map/components/CityName';
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
//naiveUi图标
import { Icon } from '@vicons/utils';
import { CarSport, Calendar, Gift, Ticket, CarOutline, LocationOutline, PersonSharp, ReceiptOutline } from '@vicons/ionicons5';
import BarandChild from './BarandChild.vue';
export default {
  components: {
    //naiveUi图标
    NavBar,
    Icon,
    CarSport,
    Calendar,
    Gift,
    Ticket,
    CarOutline, //首页
    LocationOutline, //地图
    PersonSharp, //我的
    ReceiptOutline, //咨询
    BarandChild,
    CityName,
  },
  data() {
    return {
      swiperPic: null,
      ccc: false,
      swiperNews: null,
      carList: null,
      logoWidth: 500,
      active: 'home',
    };
  },
  methods: {
    toPoints() {
      let userinfo = JSON.parse(localStorage.getItem('userinfo'));
      if (!userinfo) {
        this.$router.push('/login');
      } else {
        this.$router.push('/pointsShop');
      }
    },
    // 请求轮播图
    initialize(city) {
      axios.get(`/v1/activitys/search/${city}`).then(res => {
        this.swiperPic = res.data;
        // console.log(this.swiperPic);
      });
      axios.get(`/v1/news/search`).then(res => {
        this.swiperNews = res.data;
        // console.log(this.swiperNews);
      });
    },
    // 请求参展品牌
    initcar() {
      axios.get('/v1/barands/barands').then(res => {
        this.carList = res.data.results;
        // 动态的给carList盒子一个宽度
        this.logoWidth = (this.carList.length * 120) / 2;
      });
    },
  },
  mounted() {
    this.initialize('郑州');
    this.initcar();
    // 动态计算logoList宽度的一半
  },
};
</script>

<style lang="scss" scoped>
.carousel-img {
  width: 100%;
  height: 240px;
  object-fit: cover;
}
// 导航列表
.iconList {
  display: flex;
  width: 96vw;
  height: 60px;
  margin: 20px auto;
  justify-content: space-around;
  a {
    width: 60px;
    height: 60px;
    text-align: center;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  li:nth-child(1) a {
    background: -webkit-linear-gradient(left bottom, rgb(141, 22, 252), rgb(101, 10, 247));
  }
  li:nth-child(2) a {
    background: -webkit-linear-gradient(left bottom, rgb(254, 42, 30), rgb(245, 153, 38));
  }
  li:nth-child(3) a {
    background: -webkit-linear-gradient(left bottom, rgb(247, 111, 38), rgb(250, 157, 40));
  }
  li:nth-child(4) a {
    background: -webkit-linear-gradient(left bottom, rgb(245, 45, 70), rgb(255, 43, 145));
  }
}
// 小轮播图
.my-swipe {
  width: 47vw;
  margin: 0 auto;
  // margin-top: 40px;
  height: 30vw;
  img {
    width: 47vw;
    height: 28vw;
    display: block;
    border-radius: 10px;
    box-shadow: -0px 0 3px -1px rgb(27, 27, 27),
      //左边阴影
      0 -2px 3px -1px rgb(63, 63, 65),
      //顶部阴影
      0 5px 5px -1px rgb(71, 71, 71),
      // 底部阴影
      2px 0 3px -1px rgb(42, 42, 41); //右边阴影
  }
}
// 滚动小logo
.logoWarpper {
  width: 96vw;
  overflow: auto;
  margin-top: 20px;
  .logoList {
    width: 100px;
    display: flex;
    flex-wrap: wrap;
    img {
      width: 100px;
      margin: 5px 10px;
    }
  }
}
// floor
.tabbarWarpper {
  height: 10vh;
}
.navItem {
  background-color: white;
  color: black;
  font-size: 16px;
  position: fixed;
  box-shadow: none;
  top: 0;
  left: 0;
  right: 0;
  z-index: 9;
}
/* 页脚 */
.my_footer {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
</style>
