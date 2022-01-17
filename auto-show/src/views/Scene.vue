<template>
  <div>
    <van-nav-bar fixed title="门票预约" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <div style="margin-top: 8vh" v-if="data">
      <scene-child v-for="item in data.session" :key="item.s_id" :session="item" />
    </div>
  </div>
</template>

<script>
// 引入axios
import axios from 'axios';
// 设置公共的请求头
axios.defaults.baseURL = 'http://127.0.0.1:3000';
// 引入reactive
import { reactive } from 'vue';
import SceneChild from './SceneChild.vue';
export default {
  components: { SceneChild },
  setup() {
    const data = reactive({});
    axios.get('/v1/scenes/sceneList/x').then(res => {
      // 吧请求到的数据给data.session
      data.session = [...res.data.results];
      // console.log(data.session);
    });
    return {
      data,
    };
  },
};
</script>

<style lang="scss" scoped></style>
