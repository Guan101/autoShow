<template>
  <div>
    <div>
      <van-nav-bar fixed title="资讯详情" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
      <div class="zdy-ndetails" v-html="data.n_details"></div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';

export default {
  data() {
    return {
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
      axios.get(`/v1/news/search`).then(res => {
        this.data = res.data.data[index];
        // console.log(this.data);
      });
    },
  },
};
</script>
<style lang="scss">
.zdy-ndetails {
  // text-align: center;
  padding: 0 5vw;
  margin-top: 8vh;
  img {
    display: block;
    margin: 0 auto;
    width: 95%;
    border-radius: 12px;
  }
}
</style>
