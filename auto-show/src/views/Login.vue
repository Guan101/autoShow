<template>
  <div>
    <van-nav-bar
      title="登录"
      left-text="返回"
      right-text="注册"
      left-arrow
      @click-left="$router.go(-1)"
      @click-right="$router.push('/register')"
    />
    <n-form>
      <n-form-item-row>
        <n-input
          placeholder="用户名"
          round
          size="medium"
          v-model:value="uname"
          @blur="checkName"
          class="diy_input"
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
          size="medium"
          v-model:value="upwd"
          @blur="checkPwd"
          class="diy_input"
          clearable
        />
      </n-form-item-row>
    </n-form>
    <n-button text block @click="$router.push('/setpwd')" class="diy_text">
      忘记密码？
    </n-button>
    <div class="text_box">
      <van-checkbox v-model="checkeds" class="diy_txt"
        >我已阅读《服务条款》和《个人信息保护政策》</van-checkbox
      >
    </div>
    <n-button
      type="primary"
      block
      round
      :disabled="show"
      size="large"
      @click="checkForm"
      class="diy_but"
      >登录</n-button
    >
  </div>
</template>
<script>
import axios from "axios";
import { Toast } from 'vant';
import { onMounted, ref, watch } from "vue";
axios.defaults.baseURL = "http://127.0.0.1:3000";
export default {
  setup() {
    const checkeds = ref(false);
    const show = ref(true);
    watch(checkeds, (newProps, oldProps) => {
      if (newProps == true) {
        show.value = false;
      }else if(newProps == false){
        show.value = true;
      }
    });

    return { checkeds, show };
  },
  data() {
    return {
      uname: "",
      upwd: "",
    };
  },
  methods: {
    /** 验证用户名  6~15位单词字符 */
    checkName() {
      let reg = /^\w{6,15}$/;
      if (reg.test(this.uname)) {
        // 验证成功
        return true;
      } else {
        // 验证失败
        return false;
      }
    },
    /** 验证密码 */
    checkPwd() {
      let reg = /^\d{6}$/;
      if (reg.test(this.upwd)) {
        return true;
      } else {
        return false;
      }
    },
    /** 验证表单 */
    checkForm() {
      if (this.checkName() && this.checkPwd()) {
        let params = `username=${this.uname}&password=${this.upwd}`;
        axios.post("/user/login", params).then((res) => {
          if (res.data.code == 200) {
            let obj = {
              name: res.data.result.u_name,
              phone: res.data.result.phone,
              u_id: res.data.result.u_id,
            };
            Toast(`${obj.name},欢迎！`);
            this.$store.commit("loginOk", obj);
            this.$router.push("/Me");
          } else {
            Toast("账号密码输入错误，请重试");
          }
        });
      } else {
        Toast("格式不正确，请重试");
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.text_box {
  margin: 0 auto;
  width: 90vw;
}
.diy_txt {
  font-size: 3vw;
}
.diy_but {
  width: 90vw;
  margin: 0 auto;
  margin-top: 5vh;
}
.diy_input {
  width: 90vw;
  margin: 0 auto;
}
.diy_text {
  width: 20vw;
  position: relative;
  left: 75vw;
  bottom: 2vh;
}
</style>