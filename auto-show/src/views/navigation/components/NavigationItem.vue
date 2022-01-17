<template>
  <div class="navigation">
    <!-- 左侧文字 -->
    <div class="shop">
      <div class="shop_address">
        <div class="shop_name">{{ shops.shop_name }}</div>
        <div class="shop_address_font">
          <img src="~assets/img/navigation/address.svg" alt="" />
          <span>
            {{ shops.shop_address }}
          </span>
          <img src="~assets/img/navigation/toRight.png" alt="" />
        </div>
      </div>
      <!-- img -->
      <div class="phone" @click="call">
        <img src="~assets/img/navigation/phone.svg" alt="" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    shops: {
      data() {
        return [];
      },
    },
  },
  methods: {
    call() {
      window.location.href = this.shops.shop_phone;
    },
  },
};
</script>

<style>
.navigation {
  padding: 0.5rem 1.2rem;
  font-size: 18px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: 10px solid #eee;
}
.shop {
  width: 100%;
  display: flex;
}
.shop .shop_address {
  width: 80%;
}
.shop .phone {
  /* flex: 1; */
  width: 20%;
  display: block;
  text-align: center;
}
.shop .shop_address_font {
  display: flex;
  width: 80%;
  margin: 0.5rem 0;
}
span {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.shop_name {
  width: 100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
/* .shop {
  width: 80%;
}

.navigation .shop_address {
  align-items: center;
  margin: 0.5rem 0;
}
.navigation .shop_address .shop_address_font {
  width: 80%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}*/
.navigation .shop_address img {
  width: 20px;
  display: block;
}
.navigation .phone img {
  width: 40px;
}
</style>