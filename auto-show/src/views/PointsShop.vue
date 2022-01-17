<template>
  <div>
    <van-nav-bar fixed title="积分商城" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
  </div>
  <n-tag style="margin-top: 8vh; width: 100vw" type="warning">剩余积分：{{ userInfo.u_points }} </n-tag>
  <div>
    <van-card v-for="item in data" :key="item.p_id" :title="`${item.p_name}`" :thumb="`${item.p_pic}`">
      <template #tags>
        <van-tag style="text-decoration: line-through" plain type="danger">¥{{ item.p_price }}.00</van-tag>
        <van-button
          @click="exchange(item.p_points, item.p_name, item.p_num, item.p_pic)"
          size="mini"
          type="danger"
          style="position: absolute; right: 0"
          >兑换</van-button
        >
        <van-tag plain style="position: absolute; left: 0; bottom: 30px">{{ item.p_points }}积分</van-tag>
        <van-tag plain style="position: absolute; right: 0; bottom: 30px">剩余:{{ item.p_num }}</van-tag>
      </template>
      <template #footer>
        <van-button @click="activate('bottom')" size="mini">填写收货信息</van-button>
        <n-drawer v-model:show="active" :width="502" :placement="placement">
          <n-drawer-content title="填写收货信息">
            <n-input v-model:value="txname" type="text" placeholder="填写姓名" />
            <n-input v-model:value="txphone" type="number" placeholder="填写电话" />
            <n-input v-model:value="txaddr" type="text" placeholder="填写地址" />
            <n-button
              type="success"
              :disabled="txname.trim() == '' || txphone.trim() == '' || txaddr.trim() == ''"
              @click="() => (active = false)"
              >保存地址</n-button
            >
          </n-drawer-content>
        </n-drawer>
      </template>
    </van-card>
  </div>
</template>

<script>
import axios from 'axios';
import { ref } from 'vue';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
export default {
  setup() {
    const active = ref(false);
    const placement = ref('right');
    const activate = place => {
      active.value = true;
      placement.value = place;
    };
    return {
      active,
      placement,
      activate,
    };
  },
  data() {
    return {
      data: [],
      userInfo: {},
      phone: '',
      txname: '',
      txphone: '',
      txaddr: '',
    };
  },
  methods: {
    getProducts() {
      axios.get('/v1/points/search').then(res => {
        this.data = res.data.data;
      });
    },
    getUserInfo() {
      axios.get(`/v1/points/points?phone=${this.phone}`).then(res => {
        this.userInfo = res.data.data[0];
      });
    },
    // 更新用户积分
    updatePoints(points, phone) {
      let params = `u_points=${points}&phone=${phone}`;
      axios.put('/v1/points/xgpoints', params).then(res => {});
    },
    // 更新商品数量
    updateProducts(name, num) {
      let params = `p_name=${name}&p_num=${num}`;
      axios.put('/v1/points/xgproduct', params).then(res => {});
    },
    // 添加订单
    addppOrder(obj) {
      let { po_pname, po_pic, po_points, po_addr, po_name, po_phone, po_time, u_id } = obj;
      let params = `po_pname=${po_pname}&po_pic=${po_pic}&po_points=${po_points}&po_addr=${po_addr}&po_name=${po_name}&po_phone=${po_phone}&po_time=${po_time}&u_id=${u_id}`;
      axios.post('/v1/points/pporder', params).then(res => {});
    },
    // 兑换
    exchange(point, name, num, pic) {
      if (this.txname != '' && this.txphone != '' && this.txaddr != '') {
        let u_points = this.userInfo.u_points;
        let u_id = JSON.parse(localStorage.getItem('userinfo')).u_id;
        if (u_points >= point && num > 0) {
          u_points = u_points - point;
          this.updatePoints(u_points, this.phone);
          let p_name = name;
          let p_num = num - 1;
          this.updateProducts(p_name, p_num);
          this.$router.push('/pointsResult');
          let dday = new Date();
          let year = dday.getFullYear();
          let month = dday.getMonth() + 1;
          let date = dday.getDate();
          let time = year + '-' + month + '-' + date;
          let pporder = {
            po_pname: p_name,
            po_pic: pic,
            po_points: point,
            po_addr: this.txaddr,
            po_name: this.txname,
            po_phone: this.txphone,
            po_time: time,
            u_id: u_id,
          };
          this.addppOrder(pporder);
        } else {
          this.$toast('积分/库存不足');
          return;
        }
      } else {
        this.$toast('请先填写收货信息');
        return;
      }
    },
  },

  mounted() {
    let userinfo = JSON.parse(localStorage.getItem('userinfo'));
    this.getProducts();
    this.phone = userinfo.phone;
    this.getUserInfo();
  },
};
</script>
<style lang="scss" scoped>
a {
  text-decoration: none;
}
h1,
h2 {
  margin: 0;
  font-size: 16px;
}
.content {
  padding: 16px 16px 160px;
}
</style>
