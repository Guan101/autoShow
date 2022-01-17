<template>
  <div class="shops">
    <div class="shopsItem" v-for="(item, index) in shops" :key="index">
      <div class="address">
        <h3>{{ item.shop_name }}</h3>
        <h6 @click="toNavigation(index)">{{ item.shop_address }}</h6>
      </div>
      <div class="phone" @click="call(index)">
        <img src="~assets/img/navigation/phone.svg" alt="" />
        <div>联系我们</div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      id: this.shop_b_id,
      shops: [],
    };
  },
  props: {
    shop_b_id: {
      type: String,
      default() {
        return "";
      },
    },
  },
  methods: {
    getShops() {
      let url =
        "/v1/barands/shops/?sid=" +
        this.shop_b_id +
        "&cityName=" +
        this.$store.state.cityName;
      axios.get(url).then((res) => {
        this.shops = res.data.result;
        // console.log(this.shops);
      });
    },
    call(index) {
      // console.log(this.shops[index]);
      window.open(`tel:${this.shops[index].shop_phone}`, "_blank");
    },
    toNavigation(index) {
      this.$router.push({
        path: "/navigation",
        query: { address: this.shops[index].shop_address },
      });
    },
  },
  mounted() {
    this.getShops();
  },
};
</script>

<style>
.shops {
  /* width: 95%; */
  /* justify-content: space-between; */
}
.shopsItem {
  padding: 0.5rem 1.3rem;
  display: flex;
  width: 85%;
  height: 15vh;
  margin: auto;
  margin-top: 1rem;
  border-radius: 25px;
  background-color: #f5f5f5;
  box-shadow: 0.1rem 0.1rem 0.1rem #eee;
}
.shopsItem .address > h3,
.shopsItem .address > h6 {
  width: 75%;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.shopsItem > :nth-child(1) {
  width: 80%;
}
.phone {
  position: relative;
  top: 25%;
  text-align: center;
  font-size: 0.5rem;
  width: 4rem;
}
.shops img {
  width: 2.3rem;
}
</style>