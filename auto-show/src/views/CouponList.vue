<template>
  <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>我的优惠券</div>
    </template>
  </nav-bar>
  <!-- 优惠券单元格 -->
  <van-coupon-cell class="my_coupon" :coupons="coupons" :chosen-coupon="chosenCoupon" @click="showList = true" />
  <!-- 优惠券列表 -->
  <van-popup v-model:show="showList" round position="bottom" style="height: 90%; padding-top: 4px">
    <van-coupon-list
      :coupons="coupons"
      :chosen-coupon="chosenCoupon"
      :disabled-coupons="disabledCoupons"
      @change="onChange"
      @exchange="onExchange"
    />
  </van-popup>
</template>
<script>
import { ref } from 'vue';
import NavBar from '../components/NavBar.vue';
import { ChevronBack } from '@vicons/ionicons5';
import { Icon } from '@vicons/utils';
export default {
  components: { ChevronBack, Icon, NavBar },
  setup() {
    //   可用商品---商品列表 coupons
    const coupon = {
      available: 1,
      condition: '无使用门槛\n使用优惠立减 12元',
      reason: '',
      value: 1200,
      name: '展票立减券',
      startAt: 1622104000,
      endAt: 1660104000,
      valueDesc: '12',
      unitDesc: '元',
    };
    const coupon2 = {
      available: 1,
      condition: '满50元立减15元',
      reason: '',
      value: 1500,
      name: '满减券',
      startAt: 1622104000,
      endAt: 1660104000,
      valueDesc: '15',
      unitDesc: '元',
    };
    const coupon3 = {
      available: 1,
      condition: '无使用门槛\n最多优惠10元',
      reason: '',
      value: 1000,
      name: '随机券',
      startAt: 1622104000,
      endAt: 1660104000,
      valueDesc: '10',
      unitDesc: '元',
    };
    const coupons = ref([coupon, coupon2, coupon3]);
    //   不可用商品---商品列表 disabledCoupons
    const disabledCoupon = {
      available: 1,
      condition: '无使用门槛\n最多优惠100元',
      reason: '',
      value: 10000,
      name: '优惠券',
      startAt: 1622104000,
      endAt: 1660104000,
      valueDesc: '100',
      unitDesc: '元',
    };
    const disabledCoupon1 = {
      available: 1,
      condition: '无使用门槛\n最多优惠50元',
      reason: '',
      value: 5000,
      name: '优惠券',
      startAt: 1622104000,
      endAt: 1660104000,
      valueDesc: '50',
      unitDesc: '元',
    };
    const disabledCoupons = ref([disabledCoupon, disabledCoupon1]);
    const showList = ref(false);
    const chosenCoupon = ref(-1);

    const onChange = index => {
      showList.value = false;
      chosenCoupon.value = index;
    };
    const onExchange = code => {
      coupons.value.push(coupon);
    };

    return {
      coupons,
      showList,
      onChange,
      onExchange,
      chosenCoupon,
      disabledCoupons,
    };
  },
};
</script>
<style scoped>
.navItem {
 background-color: white;
 color: black;
 font-size: 16px;
 position: fixed;
 box-shadow: none;
 top: 0;
 left: 0;
 right: 0;
z-index: 9;
}
.my_coupon{
  position: absolute;
  top:6vh;
  border-top: 1px solid rgb(231, 231, 231);
  border-bottom:1px solid rgb(231, 231, 231)
}
</style>
