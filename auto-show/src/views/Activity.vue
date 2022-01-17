<template>
  <div>
    <van-nav-bar fixed title="活动列表" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <div class="zdy-alist" v-if="data">
      <div v-for="(item, index) in data" :key="index">
        <router-link :to="`/activityDetails?num=${index}`">
          <n-card :bordered="false" hoverable class="zdy-card">
            <img :src="`${item.a_pic}`" />
          </n-card>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
export default {
  data() {
    return {
      data: null,
      acity: '郑州',
    };
  },
  methods: {
    activity() {
      axios.get(`/v1/activitys/search/${this.acity}`).then(res => {
        this.data = res.data.data;
        // console.log(this.data);
      });
    },
  },
  mounted() {
    this.activity();
  },
};
</script>
<style lang="scss">
.n-card {
  max-width: 450px;
}
.zdy-alist {
  margin-top: 8vh;
  .zdy-card {
    margin: 0 auto;
    text-align: center;
    img {
      width: 100%;
      border-radius: 12px;
      box-shadow: 4x 4x 7px #e7b1c23f, -4x -4x 7px #e7b1c23f, -4x 4x 7px #e7b1c23f, 4x -4x 7px #e7b1c23f;
    }
  }
}
</style>
