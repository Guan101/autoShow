<template>
  <div>
    <van-nav-bar fixed title="活动详情" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <div class="zdy-aalist">
      <img :src="`${data.a_pic}`" alt="" />
      <div class="zdy-adetails" v-html="data.a_details"></div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';

export default {
  data() {
    return {
      acity: '郑州',
      data: {},
      num: null,
    };
  },
  mounted() {
    let num = this.$route.query.num;
    // console.log(num);
    this.getDetails(num);
  },
  methods: {
    getDetails(index) {
      axios.get(`/v1/activitys/search/${this.acity}`).then(res => {
        this.data = res.data.data[index];
        // console.log(this.data);
      });
    },
  },
};
</script>
<style lang="scss">
.zdy-aalist {
  margin-top: 8vh;
  img {
    display: block;
    margin: 0 auto;
    width: 90%;
    border-radius: 12px;
  }
  .zdy-adetails {
    padding: 15px;
  }
}
</style>
