<template>
  <div>
    <div v-if="sessions">
      <router-link
        @click="isLogin"
        class="warpper"
        :to="{ path: '/buyticket', query: { id: sessions.data.session.s_id, name: sessions.data.session.s_name } }"
      >
        <!-- <img :src="sessions.data.session.s_pic" alt=""> -->
        <n-card>
          <template #cover>
            <span>安心看</span>
            <img :src="sessions.data.session.s_pic" />
            <div class="textFamily">
              <b>{{ sessions.data.session.s_name }}</b>
              <div style="margin: 4px 0; font-size: 15px">
                起止日期：{{ sessions.data.session.showStartTime }}-{{ sessions.data.session.showEndTime }}
              </div>
              <div>
                <b style="font-size: 1.2rem">{{ sessions.data.session.s_address }}</b
                ><span style="color: rgb(143, 143, 143); float: right">点击预约>>></span>
              </div>
            </div>
          </template>
        </n-card>
        <!-- <div class="textFamily">
          <b>{{sessions.data.session.s_name}}</b>
          <span style="font-weight: 600;" >{{sessions.data.session.s_address}}</span>
          <div style="margin:4px 0">起止日期：{{sessions.data.session.showEndTime}}-{{sessions.data.session.showStartTime}}</div>
          <div style="float: right;">点击购票<span style="color: rgb(143, 143, 143);">>>></span></div>
        </div> -->
      </router-link>
    </div>
  </div>
</template>

<script>
import { Toast } from 'vant';
import { ref, reactive } from 'vue';
import router from '@/router/index.js';
export default {
  // 拿到Scene传递过来的参数
  props: ['session'],
  // 把父元素传递过来的参数拿到setup (父元素的参数，父元素的方法)
  setup(data) {
    // 创建一个sessions对象把他的data接收父组件的参数
    const sessions = reactive({
      data,
    });
    // 判断是否登录
    const isLogin = () => {
      let user = JSON.parse(localStorage.getItem('userinfo'));
      if (!user) {
        // console.log(user.u_id);
        Toast('请先登录');
        router.push('/login');
      }
    };
    // console.log(data.session);
    return {
      sessions,
      isLogin,
    };
  },
};
</script>

<style lang="scss" scoped>
a {
  color: black;
}
.warpper {
  width: 96vw;
  margin: 2vw auto;
  display: flex;
  padding: 1vh 0;
  // >span{
  //   position: absolute;
  //   background-color: rgb(250, 190, 57);
  //   width: 15vw;
  //   height: 3vh;
  //   text-align: center;
  //   font-size: 12px;
  //   line-height: 3vh;
  //   border-bottom-left-radius: 0;
  //   border-top-left-radius: 10px;
  //   border-bottom-right-radius: 15px;
  // }
  img {
    border-radius: 10px;
    // box-shadow: 0px 2px 1px 1px rgb(165, 165, 165);
  }
  .n-card {
    max-width: 450px;
    border-radius: 10px;
    .n-card-cover > span:nth-child(1) {
      position: absolute;
      background-color: rgb(250, 190, 57);
      width: 20vw;
      height: 3vh;
      text-align: center;
      padding: 3px 0;
      font-size: 1rem;
      font-weight: 600;
      line-height: 3vh;
      border-bottom-left-radius: 0;
      border-top-left-radius: 10px;
      border-bottom-right-radius: 10px;
    }
    .textFamily {
      margin: 1vh;
      // border: 1px solid red;
      font-size: 1.1rem;
      margin-left: 5vw;
    }
  }
  // .textFamily{
  //   b{
  //     text-overflow: -o-ellipsis-lastline;
  //     overflow: hidden;
  //     text-overflow: ellipsis;
  //     display: -webkit-box;
  //     -webkit-line-clamp: 2;
  //     line-clamp: 2;
  //     -webkit-box-orient: vertical;
  //     font-size: 1.3rem;
  //     margin-bottom: 5px;
  //   }
  //   :nth-child(2){
  //     padding: 3px 3vw;
  //     background-color: #eab964;
  //     border-radius: 7px;
  //   }
  //   margin-left: 2vw;
  // }
}
</style>
