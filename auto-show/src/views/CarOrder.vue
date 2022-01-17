<template>
  <van-nav-bar fixed title="我的订单" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
  <div style="margin-top: 8vh" v-if="datas.leng > 0">
    <div v-for="item in datas.info" :key="item.o_id" @click="aaa(item.o_id)">
      <van-cell is-link @click="showPopup">
        <van-card :num="1" :price="item.o_number / 100" :desc="item.o_name" :title="item.tname" />
      </van-cell>
      <!-- 弹出层内容 -->
      <van-popup id="popup" v-model:show="show" position="bottom" round :style="{ height: '60%' }">
        <div class="QRcode">
          <qrcode-vue :value="text" :size="size" levenl="H" />
        </div>
        <h1 style="margin: 2vh auto; text-align: center; font-size: 18px">参展请将二维码展示给工作人员</h1>
        <van-button style="position: absolute; bottom: 3vh" type="primary" round size="large" @click="close">关闭</van-button>
      </van-popup>
    </div>
  </div>
  <div v-else>
    <van-empty description="暂无订单" />
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
import QrcodeVue from 'qrcode.vue';
import { ref, onMounted, reactive } from '@vue/runtime-core';
export default {
  components: { QrcodeVue },
  setup() {
    const datas = reactive({});
    const price = ref('');
    const init = () => {
      // 动态的获取用户的id
      let user = JSON.parse(localStorage.getItem('userinfo'));
      let params = `o_u_id=${user.u_id}`;
      axios.post('/v1/p_order/p_orderInfo', params).then(res => {
        datas.info = res.data.data;
        datas.leng = res.data.data.length;
        console.log(datas.info.length);
      });
    };
    // 弹出
    const show = ref(false);
    const showPopup = () => {
      show.value = true;
    };
    // 二维码
    const text = ref();
    const size = ref(200);
    const aaa = id => {
      text.value = id;
      // console.log(id);
    };
    const close = () => {
      show.value = false;
    };
    onMounted(() => {
      init();
    });
    return {
      datas, //初始化订单信息
      aaa,
      size,
      text,
      show,
      showPopup,
      close, //关闭弹出框
    };
  },
};
</script>

<style lang="scss">
.QRcode {
  width: 200px;
  margin: 4vh auto;
}
.van-icon-arrow:before {
  content: '';
}
</style>
