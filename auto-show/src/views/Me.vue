<template>
  <!-- <van-nav-bar flex left-text="我的" title="我的资料" /> -->
  <div class="msgbox" backgroundColor:blue>
    <img class="m_img" :src="hpic" />
    <tbutton class="zdy_but"></tbutton>
    <div class="m_text">
      <p v-if="isshow">{{ name }}</p>
      <p v-else @click="gologin">点击登录</p>
      <p>{{ phone }}</p>
    </div>
    <div class="setinfo" @click="escLogin">
      <svg
        t="1639469000820"
        class="icon"
        viewBox="0 0 1024 1024"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        p-id="6732"
        width="30"
        height="30"
      >
        <path
          d="M835.584 63.488q26.624 0 49.664 10.24t40.448 27.648 27.648 40.448 10.24 49.664l0 641.024q0 26.624-10.24 49.664t-27.648 40.448-40.448 27.648-49.664 10.24l-448.512 0q-26.624 0-49.664-10.24t-40.448-27.648-27.648-40.448-10.24-49.664l0-192.512 128 0 0 192.512 448.512 0 0-641.024-448.512 0 0 192.512-128 0 0-192.512q0-26.624 10.24-49.664t27.648-40.448 40.448-27.648 49.664-10.24l448.512 0zM513.024 614.4q0-19.456-9.728-28.672t-24.064-9.216l-378.88 0q-14.336 0-25.088-7.68t-10.752-26.112l0-52.224q0-29.696 9.216-37.376t35.84-7.68l31.744 0q24.576 0 58.368 0.512t73.728 1.024 77.312 1.024 69.12 0.512l51.2 0q22.528 0 32.256-16.384t9.728-35.84l0-49.152q0-20.48 8.704-25.6t26.112 9.216 47.104 32.768 61.952 37.888 62.976 38.4 49.152 34.304q14.336 11.264 14.336 30.72t-11.264 28.672q-16.384 14.336-44.544 32.256t-59.392 36.864-60.928 37.376-48.128 33.792q-23.552 19.456-34.816 19.968t-11.264-30.208l0-49.152z"
          p-id="6733"
          fill="#e6e6e6"
        ></path>
      </svg>
      退出
    </div>
  </div>
  <div class="gongge">
    <div class="gongge_item" @click="gocou">
      <van-icon name="balance-list-o" class="my_icon" badge="3" size="15vw" />
      <div>优惠卷</div>
    </div>
    <div class="gongge_item" @click="goticket">
      <van-icon name="coupon-o" class="my_icon" :badge="oLength" size="15vw" />
      <div>门票</div>
    </div>
    <div class="gongge_item" @click="goorder">
      <van-icon name="todo-list-o" class="my_icon" :badge="dLength" size="15vw" />
      <div>订单</div>
    </div>
  </div>
  <div class="menubox">
    <div class="menu_item" @click="$router.push('/mycollect')">
      <van-icon name="orders-o" />&nbsp;<span>我的收藏</span><van-icon name="arrow" />
    </div>
    <div class="menu_item" @click="$router.push('/myhistory')">
      <van-icon name="underway-o" /><span>&nbsp;浏览历史</span><van-icon name="arrow" />
    </div>
    <div class="menu_item" @click="$router.push('/mysetter')">
      <van-icon name="info-o" /><span>&nbsp;个人设置</span><van-icon name="arrow" />
    </div>
    <div class="menu_item" @click="gosetting">
      <van-icon name="smile-comment-o" /><span>&nbsp;帮助反馈</span><van-icon name="arrow" />
    </div>
  </div>
  <van-tabbar class="my_footer" v-model="active">
    <router-link to="/">
      <van-tabbar-item name="home" icon="wap-home">主页</van-tabbar-item>
    </router-link>
    <router-link to="/map">
      <van-tabbar-item name="location" icon="location">地图</van-tabbar-item>
    </router-link>
    <router-link to="/news">
      <van-tabbar-item name="more" icon="more">车友圈</van-tabbar-item>
    </router-link>
    <router-link to="/me">
      <van-tabbar-item name="manager" icon="manager">我的</van-tabbar-item>
    </router-link>
  </van-tabbar>
</template>

<script>
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
import { onMounted, ref, provide } from 'vue';
import Tbutton from '../components/Tbutton.vue';
import router from '@/router/index.js';
import { Toast } from 'vant';
import { inject } from 'vue';
export default {
  components: { Tbutton },
  setup() {
    const reload = inject('reload');
    //跳转订单页面
    const goorder = () => {
      if (localStorage.getItem('userinfo')) {
        router.push('/myorder');
      } else {
        Toast('请先登录');
        router.push('/login');
      }
    };
    //调转门票页面
    const goticket = () => {
      if (localStorage.getItem('userinfo')) {
        router.push('/carorder');
      } else {
        Toast('请先登录');
        router.push('/login');
      }
    };
    //跳转--帮助反馈
    const gosetting = () => {
      router.push('/myhelp');
    };
    //去登录
    const gologin = () => {
      router.push('/login');
    };
    //判断是否为空来显示登录的功能
    const isshow = ref('');
    const active = ref('manager');
    const panduan = () => {
      let boo = localStorage.getItem('islogin');
      if (boo == 'true') {
        isshow.value = true;
      }
    };
    //宫格跳转
    const gocou = () => {
      if (localStorage.getItem('userinfo')) {
        router.push('/couponlist');
      } else {
        Toast('请先登录');
        router.push('/login');
      }
    };
    //退出登录
    const escLogin = () => {
      if (localStorage.getItem('userinfo')) {
        localStorage.clear();
        Toast('退出');
        reload();
      } else {
        Toast('您尚未登录');
      }
    };
    // 拿到name、phone、hpic的值 动态修改
    let name = ref('');
    let phone = ref('');
    let hpic = ref(
      'http://img.51miz.com/Element/00/77/65/38/17f66115_E776538_62b0d0ab.png%21/quality/90/unsharp/true/compress/true/format/png'
    );
    let getinfo = () => {
      let userinfo = JSON.parse(localStorage.getItem('userinfo'));
      if (userinfo) {
        //发送请求,拿到该用户的手机号 名字 头像
        let params = `u_id=${userinfo.u_id}`;
        axios.post('/user/getinfo', params).then(res => {
          if (res.data.code == 200) {
            // 登录成功
            name.value = res.data.result.u_name;
            phone.value = res.data.result.phone;
            if (!(res.data.result.hpic == null)) {
              // http://127.0.0.1:3000/fec5a1cf-28da-4aeb-bb78-e2220ff584d4.jpg
              hpic.value = `http://127.0.0.1:3000/${res.data.result.hpic}`;
            }
          }
        });
      }
    };
    const oLength = ref();
    const orderLength = () => {
      let user = JSON.parse(localStorage.getItem('userinfo'));
      if (user) {
        // 动态的获取用户的id
        let params = `o_u_id=${user.u_id}`;
        axios.post('/v1/p_order/p_orderInfo', params).then(res => {
          oLength.value = res.data.data.length;
          // console.log(oLength);
        });
      }
    };
    const dLength = ref();
    const drderLength = () => {
      let user = JSON.parse(localStorage.getItem('userinfo'));
      console.log(user);
      if (user) {
        // 动态的获取用户的id
        // let params = `o_u_id=${user.u_id}`;
        axios.get(`/v1/points/pporder?id=${user.u_id}`).then(res => {
          dLength.value = res.data.data.length;
          // console.log(oLength);
        });
      }
    };
    onMounted(() => {
      getinfo();
      panduan();
      orderLength();
      drderLength();
    });
    //把手机号的值传给子组件
    provide('phoneData', phone);
    return { name, phone, hpic, escLogin, gocou, isshow, gologin, gosetting, goticket, goorder, active, oLength, dLength };
  },
};
</script>

<style lang="scss">
/* 退出的按钮 */
.van-icon-setting-o {
  position: absolute;
  top: 14vh;
  left: 23vw;
}
.setinfo {
  display: flex;
  flex-direction: column;
  position: absolute;
  right: 9vw;
}
/* 三个宫格部分 */
.gongge {
  width: 90vw;
  height: 15vh;
  display: flex;
  border-radius: 2.5vw;
  margin: 0 auto;
  position: relative;
  top: 5vh;
  overflow: hidden;
}
.gongge:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
  filter: blur(5px);
  border-radius: 3vw;
  box-shadow: 8px 8px 5px #dae4e6, -8px -8px 5px #dae4e6, -8px 8px 5px #dae4e6, 8px -8px 5px #dae4e6;
  background-image: linear-gradient(to bottom right, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.1));
  border: 1.5px solid rgba(255, 255, 255, 0.6);
}
.gongge_item {
  width: 33%;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
/* 横排菜单盒子 */
.menubox {
  width: 90vw;
  height: 30vh;
  margin: 0 auto;
  border-radius: 2.5vw;
  position: relative;
  top: 7vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}
.menubox:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
  filter: blur(5px);
  border-radius: 3vw;
  box-shadow: 8px 8px 5px #dae4e6, -8px -8px 5px #dae4e6, -8px 8px 5px #dae4e6, 8px -8px 5px #dae4e6;
  background-image: linear-gradient(to bottom right, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.1));
  border: 1.5px solid rgba(255, 255, 255, 0.6);
}
.van-icon-arrow {
  position: absolute;
  right: 0vw;
}
.menu_item {
  height: 25%;
  width: 95%;
  margin: 0 auto;
  position: relative;
  display: flex;
  align-items: center;
}
.n-layout-header,
.n-layout-footer {
  background: rgba(128, 128, 128, 0.2);
  padding: 24px;
}
.n-layout-sider {
  background: rgba(128, 128, 128, 0.3);
}
.n-layout-content {
  background: rgba(128, 128, 128, 0.4);
}
.van-nav-bar__text {
  color: black;
  font-size: 16px;
}
/* 头像右边的文本 */
.msgbox {
  width: 90vw;
  height: 20vh;
  margin: 0 auto;
  border-radius: 2.5vw;
  position: relative;
  top: 3vh;
  display: flex;
  align-items: center;
  overflow: hidden;
}
.msgbox:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
  filter: blur(2px);
  border-radius: 3vw;
  box-shadow: 8px 8px 5px #dae4e6, -8px -8px 5px #dae4e6, -8px 8px 5px #dae4e6, 8px -8px 5px #dae4e6;
  background-image: linear-gradient(to bottom right, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.1));
  border: 1.5px solid rgba(255, 255, 255, 0.6);
}
.m_img {
  width: 20vw;
  display: block;
  border-radius: 30%;
  margin-left: 5vw;
}
.m_text {
  margin-left: 5vw;
}
.van-hairline--top {
  position: relative;
  top: 5vh;
}
/* 页脚 */
.my_footer {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
</style>
