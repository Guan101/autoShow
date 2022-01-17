<template>
  <div id="warpper">
    <van-nav-bar fixed title="品牌列表" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <van-search
      class="inp"
      input-align="center"
      maxlength="7"
      show-action
      clearable
      v-model="search"
      placeholder="请输入搜索关键词"
    />
    <div v-if="bas">
      <van-list v-model:loading="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
        <!-- 调用组件 -->
        <!-- 通过计算属性的返回得到item -->
        <barand-child v-for="item in searchCar" :key="item.b_id" :itemList="item" />
      </van-list>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import BarandChild from './BarandChild.vue';
axios.defaults.baseURL = 'http://127.0.0.1:3000';

import { reactive, ref, computed, watch } from 'vue';
export default {
  components: { BarandChild },
  setup() {
    const bas = reactive({
      data: [],
    });
    const loading = ref(false);
    const finished = ref(false);
    let search = ref('');
    let page = 0;
    let carList = [];
    // let timer = null
    const onLoad = () => {
      // 异步更新数据
      setTimeout(() => {
        page++;
        let url = `/v1/barands/barand?page=${page}`;
        axios.get(url).then(res => {
          carList.push(...res.data.results);
          // console.log(aaa);
          // console.log(res.data.results);
          // console.log(bas.data);
          bas.data = [...carList];
          // console.log(bas.data);
        });
        // 加载状态结束
        loading.value = false;
        // 数据全部加载完成
        if (bas.data.length >= 23) {
          finished.value = true;
        }
      }, 1000);
    };
    // 搜索功能（节流）
    // console.log('匹配搜索的list');
    // timer = setTimeout(()=>{
    //   if(itmer) clearTimeout(timer)
    // },3000)
    const searchCar = computed(() => {
      // 把过滤出来的item返回给barandFil在html中遍历出来
      return bas.data.filter(item => {
        if (item.b_name.indexOf(search.value) !== -1) {
          return item;
        }
      });
    });
    return {
      bas,
      onLoad,
      loading,
      finished,

      search, //搜索得值
      searchCar, //搜索的计算属性
    };
  },
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
#warpeer {
  width: 100%;
  overflow: hidden;
}
.inp {
  margin: 3vh 2vw;
  margin-top: 8vh;
  width: 92vw;
  height: 4vh;
  font-size: 1.4rem;
  outline: none;
  padding: 0.5vh 0;
  &:focus {
    border-radius: 5px;
    box-shadow: 0px 0px 2px rgb(36, 130, 207);
    border: 2px solid rgb(36, 130, 207);
  }
}
</style>
