<template>
    <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>我的收藏</div>
    </template>
  </nav-bar>
  <van-tabs v-model:active="active" swipeable class="my_tabs">
    <van-tab title="全部">
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
    </van-tab>
     <van-tab title="汽车">
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
    </van-tab>
     <van-tab title="车展">
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
      <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      /> 
    </van-tab>
    <van-tab title="活动">
        <van-card
        num="2"
        price="2.00"
        desc="描述信息"
        title="商品标题"
        thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
      />
    </van-tab>
    <van-tab title="礼品" class="my_gift">
        <span>暂无更多</span>
    </van-tab>
  </van-tabs>
</template>
<script>
import { ref } from "vue";
import NavBar from "../components/NavBar.vue";
import { ChevronBack } from "@vicons/ionicons5";
import { Icon } from "@vicons/utils";
export default {
  components: { ChevronBack, Icon, NavBar },
  setup() {
    const active = ref("");
    return {
      active,
    };
  },
};
</script>
<style scoped>
.my_tabs {
  margin-top: 8vh;
}
.my_gift{
    text-align: center;
}
</style>