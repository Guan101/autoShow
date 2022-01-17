<template>
<nav-bar class="navItem">
 <template #left>
   <Icon> 
    <ChevronBack @click="$router.go(-1)" />  
     </Icon>
     </template>
      <template #center>
        <div>注册</div>
         </template>
         <template #right>
        <div @click="$router.push('/login')">登录</div>
         </template>
</nav-bar>
  <n-card class="diy_card">
        <n-form>
          <n-form-item-row>
            <n-input
              placeholder="用户名"
              size="large"
              round
              v-model:value="uname"
              @blur="checkName"
              clearable
            />
          </n-form-item-row>
          <n-form-item-row>
            <n-input
              type="password"
              show-password-on="click"
              placeholder="密码"
              :maxlength="8"
              round
              size="large"
              v-model:value="upwd"
              @blur="checkUpwd"
              clearable
            />
          </n-form-item-row>
          <n-form-item-row>
            <n-input
              type="password"
              show-password-on="click"
              placeholder="确认密码"
              :maxlength="8"
              round
              size="large"
              v-model:value="rupwd"
              @blur="checkReupwd"
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
        </n-form>
        <n-button type="primary" block @click="register" round size="large" class="diy_reg"
          >注册</n-button
        >
  </n-card>
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
import { Toast } from 'vant';
import NavBar from '../components/NavBar.vue';
import { ChevronBack } from '@vicons/ionicons5';
import { Icon } from '@vicons/utils';
axios.defaults.baseURL = "http://127.0.0.1:3000";
export default {
  components: { ChevronBack, Icon,NavBar},
  data() {
    return {
      uname: "",
      upwd: "",
      rupwd: "",
      phone: "",
      verifyCode: "", //验证码
      data: null,
    };
  },
  methods: {
    onClickRight(){
      this.$router.push('/login')
    },
    /** 验证用户名  6~15位单词字符 */
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
    /** 验证密码 */
    checkUpwd() {
      console.log(this.pwd);
      let reg = /^\d{6}$/;
      if (reg.test(this.upwd)) {
        Toast("密码格式正确");
        return true;
      } else {
        Toast("密码格式错误，请重试");
        return false;
      }
    },

    /** 验证重复输入的密码 */
    checkReupwd() {
      let reg = /^\d{6}$/;
      if (reg.test(this.rupwd) && this.rupwd == this.upwd) {
        Toast("密码一致");
        return true;
      } else {
        Toast("两次输入密码不一致，请重新输入");
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
.diy_reg{
  margin-top: 5vw;
}
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
.diy_card{
  margin-top: 5vh;
}
</style>