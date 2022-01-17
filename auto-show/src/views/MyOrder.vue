<template>
  <van-nav-bar fixed title="我的订单" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
  <van-tabs style="margin-top: 8vh" v-model:active="active" swipeable>
    <van-tab title="全部订单">
      <div v-if="orderlist[0]">
        <van-card v-for="item in orderlist" :key="item.po_id" :title="`${item.po_pname}`" :thumb="`${item.po_pic}`">
          <template #tags>
            <van-tag plain style="position: absolute; left: 0; bottom: 30px; width: 45vw">地址:{{ item.po_addr }}</van-tag>
            <van-tag plain style="position: absolute; left: 0; bottom: 10px">兑换时间:{{ item.po_time }}</van-tag>
            <van-tag plain style="position: absolute; right: 0; bottom: 40px" type="danger">积分:{{ item.po_points }}</van-tag>
          </template>
        </van-card>
      </div>
      <div v-else style="width: 100%; text-align: center; line-height: 30px">
        <span>暂时没有订单</span>
      </div>
    </van-tab>
    <van-tab title="待支付">
      <div style="width: 100%; text-align: center; line-height: 30px">
        <span>暂时没有订单</span>
      </div>
    </van-tab>
    <van-tab title="已完成">
      <div v-if="orderlist[0]">
        <van-card v-for="item in orderlist" :key="item.po_id" :title="`${item.po_pname}`" :thumb="`${item.po_pic}`">
          <template #tags>
            <van-tag plain style="position: absolute; left: 0; bottom: 30px; width: 45vw">地址:{{ item.po_addr }}</van-tag>
            <van-tag plain style="position: absolute; left: 0; bottom: 10px">兑换时间:{{ item.po_time }}</van-tag>
            <van-tag plain style="position: absolute; right: 0; bottom: 40px" type="danger">积分:{{ item.po_points }}</van-tag>
          </template>
        </van-card>
      </div>
      <div v-else style="width: 100%; text-align: center; line-height: 30px">
        <span>暂时没有订单</span>
      </div>
    </van-tab>
  </van-tabs>
</template>
<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
import { ref } from 'vue';
export default {
  setup() {
    const active = ref('');
    return {
      active,
    };
  },
  data() {
    return {
      orderlist: [],
    };
  },
  methods: {
    getList(id) {
      axios.get(`/v1/points/pporder?id=${id}`).then(res => {
        this.orderlist = res.data.data;
      });
    },
  },
  mounted() {
    let u_id = JSON.parse(localStorage.getItem('userinfo')).u_id;
    this.getList(u_id);
  },
};
</script>
<style scoped></style>
