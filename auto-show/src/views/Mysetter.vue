<template>
  <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>设置</div>
    </template>
  </nav-bar>
  <!-- 个人信息和手机号的展示 -->
  <div class="info_box">
    <img class="my_avatar" :src="hpic" alt="" /><span>用户：{{ name }}</span>
  </div>
  <!-- 单元格选项 -->
  <van-cell title="常用身份信息" size="large" is-link to="/selfinfo" />
  <van-cell title="账号设置" size="large" is-link class="gosetinfo"/>
  <van-cell title="主题模式" size="large" is-link to="/" />
  <van-cell title="切换语言" size="large" is-link to="/" />
  <van-cell title="政策中心" size="large" is-link to="/" />
  <van-cell title="关于我们" size="large" is-link to="/" />
  <van-button type="primary" @click="escbtn" block round>退出登录</van-button>
</template>
<script>
import { Toast } from "vant";
import router from "@/router/index.js";
import { ref, onMounted } from "vue";
import NavBar from "../components/NavBar.vue";
import { ChevronBack } from "@vicons/ionicons5";
import { Icon } from "@vicons/utils";
import axios from "axios";
axios.defaults.baseURL = "http://127.0.0.1:3000";
export default {
  components: { ChevronBack, Icon, NavBar },
  setup() {
    //去设置账号  先做验证在跳转
    const gosetinfo = ()=>{
      if (localStorage.getItem("userinfo")) {
        router.push('/editinfo')
      } else {
        Toast("您尚未登录");
        router.push('/login')
      }
    }
    const escbtn = () => {
      if (localStorage.getItem("userinfo")) {
        const toast = Toast.loading({
          duration: 1000,
          forbidClick: true,
          message: "加载中...",
        });
        localStorage.clear();
        router.go(0);
      } else {
        Toast("您尚未登录");
      }
    };
    let name = ref("未登录");
    let hpic = ref(
      "http://img.51miz.com/Element/00/77/65/38/17f66115_E776538_62b0d0ab.png%21/quality/90/unsharp/true/compress/true/format/png"
    );

    let getinfo = () => {
      let userinfo = JSON.parse(localStorage.getItem("userinfo"));
      if (userinfo) {
        //发送请求,拿到该用户的手机号 名字 头像
        let params = `u_id=${userinfo.u_id}`;
        axios.post("/user/getinfo", params).then((res) => {
          if (res.data.code == 200) {
            // 登录成功
            name.value = res.data.result.u_name;
            if (!(res.data.result.hpic == null)) {
              // http://127.0.0.1:3000/fec5a1cf-28da-4aeb-bb78-e2220ff584d4.jpg
              hpic.value = `http://127.0.0.1:3000/${res.data.result.hpic}`;
            }
          }
        });
      }
    };

    onMounted(() => {
      getinfo();
    });
    return {
      name,
      hpic,
      getinfo,
      escbtn,
      gosetinfo
    };
  },
};
</script>
<style scoped>
.info_box {
  margin-top: 8vh;
  display: flex;
  align-items: center;
  border-bottom: 3px solid rgb(234, 236, 235);
  height: 14vh;
}
.my_avatar {
  width: 20vw;
  border-radius: 50%;
  display: block;
  margin-left: 5vw;
  margin-right: 5vw;
}
</style>