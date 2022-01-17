<template>
  <div>
    <!-- 展示汽车全部信息 -->
    <div v-if="itemList" class="warpper">
      <router-link :to="{ path: `/carDetails`, query: { id: itemList.b_id } }">
        <li class="carList">
          <img :src="itemList.b_logo" alt="" />
          <div class="textFamily">
            <span>{{ itemList.b_name }}</span>
            <span>{{ itemList.b_name }}系列</span>
            <span>查看车型信息></span>
          </div>
        </li>
      </router-link>
    </div>
  </div>
</template>

<script>
// 引入axios
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
export default {
  // 接收父元素Barand的参数
  props: ['itemList'],
  methods: {},
};
</script>

<style lang="scss" scoped>
* {
  padding: 0;
  margin: 0;
  list-style: none;
  a {
    display: block;
    color: black;
    text-decoration: none;
  }
}
.warpper {
  width: 96vw;
  margin: 0 auto;
}
.carList {
  width: 96vw;
  display: flex;
  font-size: 1.7rem;
  padding: 1vh 0;
  border-bottom: 1px solid rgba($color: #000000, $alpha: 0.2);
  img {
    width: 38vw;
    height: 20vh;
  }
  .textFamily {
    margin-left: 4vw;
    margin-top: 1vh;
    span:nth-child(1) {
      font-size: 2rem;
      display: block;
      margin-top: 10px;
      font-weight: 700;
    }
    span:nth-child(2) {
      color: gray;
      font-size: 0.9rem;
      display: block;
      margin-top: 10px;
    }
    span:nth-child(3) {
      color: rgb(32, 32, 32);
      font-size: 0.9rem;
      display: block;
      margin-top: 10px;
    }
  }
}
</style>
