<template>
  <div>
    <van-nav-bar fixed title="汽车详情" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <!-- logo -->
    <div v-if="carName" class="top">
      <img :src="`${carName[0].b_logo}`" @click="preview" alt="" />
      <span>{{ carName[0].b_name }}</span>
    </div>

    <div v-if="pic">
      <!-- 车图 -->
      <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
        <van-swipe-item v-for="item in pic" :key="item.b_pic_id" @click="preview(item.b_pic_id)">
          <img class="carousel-img" :src="`https://images.weserv.nl/?url=${item.bb_pic}`" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div v-if="pId">
      <Shops :shop_b_id="pId">}</Shops>
    </div>
  </div>
</template>

<script>
// 引入项目组件
import Shops from 'views/shops/Shops';
// 引入axios
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';

import { ImagePreview } from 'vant';
export default {
  components: { Shops },
  data() {
    return {
      pic: null, //请求图片
      pId: null, //父组件barand传递过来的id
      carName: null, //请求过来的name，logo
    };
  },
  methods: {
    // 请求axios
    //  初始化标题和图片
    initialize() {
      // 请求name。logo
      // console.log(this.pId);
      let url = '/v1/barands/carName/' + this.pId;
      axios.get(url).then(res => {
        this.carName = res.data.results;
        // console.log("请求的logo：",this.carName[0].b_logo);
      });
      // 请求图片
      let url1 = '/v1/barands/b_pic/' + this.pId;
      axios.get(url1).then(res => {
        this.pic = res.data.results;
        // console.log(res.data.results);
      });
    },
    preview(id) {
      let list = [];
      for (let i in this.pic) {
        list[i] = `https://images.weserv.nl/?url=${this.pic[i].bb_pic}`;
      }
      ImagePreview({
        images: list,
        startPosition: id - 1,
      });
    },
  },
  mounted() {
    // 拿到Barand.vue传递过来的参数
    this.pId = this.$route.query.id;
    // console.log('这是barand传递过来的的参数', this.$route.query.id);
    this.initialize();
  },
};
</script>

<style lang="scss" scoped>
.my-swipe .van-swipe-item {
  width: 100%;
  text-align: center;
  .carousel-img {
    width: 96%;
    height: 240px;
    border-radius: 3vw;
    object-fit: cover;
  }
}
.top {
  margin-top: 8vh;
  padding: 10vw;
  padding-top: 0;
  display: flex;
  img {
    width: 40vw;
  }
  span {
    display: flex;
    flex-direction: column;
    justify-content: center;
    font-size: 1.6rem;
    margin-left: 10vw;
  }
}
</style>
