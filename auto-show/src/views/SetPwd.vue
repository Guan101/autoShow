<template>
  <div>
    <van-nav-bar
      title="重置密码"
      left-text="返回"
      left-arrow
      @click-left="$router.go(-1)"
    />
    <n-form>
      <n-form-item-row>
        <n-input
          placeholder="手机号"
          round
          size="large"
          v-model:value="uphone"
          @blur="checkPhone"
          class="diy_input"
        />
      </n-form-item-row>
      <n-form-item-row>
        <n-input
          type="password"
          show-password-on="click"
          placeholder="新密码"
          :maxlength="8"
          round
          size="large"
          v-model:value="upwd"
          @blur="checkPwd"
          class="diy_input diy_input2"
        />
      </n-form-item-row>
    </n-form>
    <n-button
      type="primary"
      block
      round
      size="large"
      @click="submit"
      class="diy_input"
      >修改</n-button
    >
  </div>
</template>

<script>
import { Toast } from "vant";
import axios from "axios";
axios.defaults.baseURL = "http://127.0.0.1:3000";
export default {
  data() {
    return {
      uphone: "",
      upwd: "",
    };
  },
  methods: {
    /** 验证密码 */
    checkPwd() {
      let reg = /^\d{6}$/;
      if (reg.test(this.upwd)) {
        return true;
      } else {
        return false;
      }
    },
    checkPhone() {
      let reg = /^1[3456789]\d{9}$/;
      if (reg.test(this.uphone)) {
        // 验证成功
        return true;
      } else {
        // 验证失败
        return false;
      }
    },
    submit() {
      if (this.checkPwd() && this.checkPhone()) {
        // 发送注册请求
        let params = `u_pwd=${this.upwd}&phone=${this.uphone}`;
        axios.put("/user/gaimi", params).then((res) => {
          if (res.data.code == 1) {
            // 登录成功
            Toast("修改成功");
            //修改vuex中的登录状态
            // this.$store.commit("loginOk", this.name);
            this.$router.push("/login");
          } else {
            Toast("修改失败");
          }
        });
      } else {
        alert("手机号或密码格式不正确");
      }
    },
  },
};
</script>

<style lang="scss" scoped>
body {
  margin: 0;
  padding: 0;
}
.diy_input {
  width: 90vw;
  margin: 5vw auto;
}
.diy_input2 {
  margin-top: 0;
}
</style>