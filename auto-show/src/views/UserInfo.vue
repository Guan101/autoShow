<template>
  <div>
    <nav-bar class="navItem">
      <template #left>
        <Icon>
          <ChevronBack @click="$router.go(-1)" />
        </Icon>
      </template>
      <template #center>
        <div>订单</div>
      </template>
    </nav-bar>
    <n-card class="diy_card">
      <n-form>
        <n-form-item-row>
          <n-input
            placeholder="姓名"
            size="large"
            round
            v-model:value="uname"
            @blur="checkName"
            clearable
          />
        </n-form-item-row>
        <n-form-item-row>
          <n-input
            placeholder="手机号"
            round
            v-model:value="phone"
            size="large"
            @blur="checkPhone"
            clearable
          />
          <!-- 按钮 -->
        </n-form-item-row>
        <n-form-item-row>
          <n-input
            placeholder="身份证号"
            round
            v-model:value="cardid"
            size="large"
            @blur="checkcardid"
            clearable
          />

          <!-- 按钮 -->
        </n-form-item-row>
      </n-form>
      <n-button
        type="primary"
        block
        @click="register"
        round
        size="large"
        class="diy_reg"
        >注册</n-button
      >
    </n-card>
  </div>
</template>
<!-- 按需引入native组件 -->
<script setup>
import {
  NCard,
  NTabs,
  NTabPane,
  NForm,
  NFormItemRow,
  NInput,
  NButton,
} from "naive-ui";
</script>

<script>
import axios from "axios";
import { Toast } from "vant";
import NavBar from "../components/NavBar.vue";
import { ChevronBack } from "@vicons/ionicons5";
import { Icon } from "@vicons/utils";
axios.defaults.baseURL = "http://127.0.0.1:3000";
export default {
  components: { ChevronBack, Icon, NavBar },
  data() {
    return {
      uname: "",
      phone: "",
      data: null,
      cardid: "",
    };
  },
  methods: {
    /** 验证用户名  */
    checkName() {
      let reg = /^\w{6,15}$/;
      if (reg.test(this.uname)) {
        // 验证成功
        Toast("用户名格式正确");
        return true;
      } else {
        // 验证失败
        Toast("用户名格式错误，请重试");
        return false;
      }
    },
    //验证手机号
    checkPhone() {
      let reg = /^1[3456789]\d{9}$/;
      if (reg.test(this.phone)) {
        // 验证成功
        Toast("手机号格式正确");
        return true;
      } else {
        // 验证失败
        Toast("手机号格式错误，请重试");
        return false;
      }
    },
    checkcardid() {
      let reg = /^1[3456789]\d{9}$/;
      if (reg.test(this.phone)) {
        // 验证成功
        Toast("身份证格式正确");
        return true;
      } else {
        // 验证失败
        Toast("身份证格式错误，请重试");
        return false;
      }
    },

    register() {
      if (
        this.checkName() &&
        this.checkUpwd() &&
        this.checkReupwd() &&
        this.checkPhone()
      ) {
        // 发送注册请求
        let params = `username=${this.uname}&password=${this.upwd}&phone=${this.phone}`;
        axios.post("/user/register", params).then((res) => {
          if (res.data.code == 200) {
            Toast("注册成功");
            this.$router.push("/login");
          } else if (res.data.code == 201) {
            //注册失败 用户已存在
            Toast("注册失败，用户已存在");
          } else {
            //系统异常
            Toast("注册失败，服务器异常");
          }
        });
      }
    },
  },
};
</script>
<style lang="scss" scoped>
// .diy_reg{
//   margin-top: 5vw;
// }
// .navItem {
// background-color: white;
// color: black;
// font-size: 16px;
// position: fixed;
// box-shadow: none;
//  top: 0;
// left: 0;
// right: 0;
// z-index: 9;
// }
// .diy_card{
//   margin-top: 5vh;
// }
//
</style>