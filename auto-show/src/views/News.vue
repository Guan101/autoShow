<template>
  <div>
    <van-nav-bar fixed is-link title="车友圈"> </van-nav-bar>
    <!-- 轮播图--“推荐里面的文章资讯”   -->
    <!-- <van-cell value="查看更多" class="swiper-title">
      使用 title 插槽来定义标题
      <template #title>
        <span class="custom-title">为您推荐</span>
        <van-tag type="danger">精品</van-tag>
      </template>
    </van-cell> -->
    <van-swipe :autoplay="3000" lazy-render v-if="swiperdata" class="zdy_swiper">
      <van-swipe-item v-for="item in swiperdata.data" :key="item">
        <img :src="`http://127.0.0.1:3000/${item.art_imgs}`" class="swiper-img" />
        <div class="art_title">{{ item.art_title }}</div>
      </van-swipe-item>
    </van-swipe>
    <!-- 一下为全部社区内容 -->
    <!-- 评论卡片 -->
    <van-tabs v-model:active="actives" swipeable animated>
      <van-tab title="全部">
        <!-- zheli1shi卡片 -->
        <div style="margin-bottom: 9vh">
          <news-children v-for="item in artdatas" :key="item.art_id" :items="item" class="zdy_card" />
        </div>
        <!-- 发文章按钮组件 -->
      </van-tab>
      <van-tab title="关注">
        <div class="nonebox">
          <n-result status="418" title="暂无数据" description="功能还在实现中...">
            <template #footer> </template>
          </n-result>
        </div>
      </van-tab>
    </van-tabs>
    <!-- 发表文章按钮 -->
    <div class="zdy_btn" @click="$router.push('/newsbutton')">
      <van-button round color="linear-gradient(to right, #ff6034, #ee0a24)" icon="plus" type="primary"
        ><span>发表</span></van-button
      >
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
  </div>
</template>

<script>
import axios from 'axios';
import { onMounted, reactive, ref } from 'vue';
import NewsChildren from './NewsChildren.vue';

axios.defaults.baseURL = 'http://127.0.0.1:3000';
export default {
  components: { NewsChildren },
  data() {
    return {
      uid: '',
      artdatas: '',
      num: '',
      handle: true,
    };
  },
  methods: {
    // 图片加载失败时隐藏
    imageLoad(event) {
      var img = event.srcElement;
      img.outerHTML = '';
    },
    getinfo() {
      this.uid = JSON.parse(localStorage.userinfo).u_id;
      axios.get(`/v1/community/zan?u_id=${this.uid}`).then(res => {
        this.artdatas = res.data.data;
      });
    },
  },
  mounted() {
    this.getinfo();
  },

  setup() {
    //uname
    const uname = ref('');
    // 拿到全部的文章数据
    let artsdata = reactive({
      datas: [],
    });
    let artslist = [];
    const getarts = () => {
      axios.get(`/v1/community/artinfos`).then(res => {
        artslist.push(...res.data.data);
        artsdata.datas = [...artslist];
        console.log('jjjjj', artsdata.datas);
      });
    };
    // 轮播图拿数据
    let swiperdata = reactive({
      data: [],
    });
    let datalist = [];
    const getswiper = () => {
      axios.get(`/v1/community/swiper`).then(res => {
        datalist.push(...res.data.data);
        swiperdata.data = [...datalist];
      });
    };
    const actives = ref('');
    const active = ref('more');
    onMounted(() => {
      getswiper();
      getarts();
    });
    return {
      active,
      actives,
      swiperdata,
      getswiper,
      artsdata,
      uname,
    };
  },
};
</script>
<style lang="scss" scoped>
/* 页脚 */
.my_footer {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
// 除了顶部大标题，下面全部都是width：90vw
.zdy_swiper {
  height: 30vh;
  width: 90vw;
  position: relative;
  margin: 0 auto;
  margin-top: 9vh;
  border-radius: 10px;
  .art_title {
    position: absolute;
    top: 27vh;
    left: 2vw;
    color: white;
    font-weight: bold;
    z-index: 9;
  }
}
.custom-title {
  margin-right: 4px;
  vertical-align: middle;
}
.swiper-title {
  width: 90vw;
  margin: 0 auto;
  margin-top: 7vh;
}
// 轮播图尺寸设置
.swiper-img {
  width: 100%;
  display: block;
}

.comment_card {
  width: 90vw;
  margin: 2vh auto;
}
.arts_img {
  width: 100%;
}
p {
  margin: 0;
}
.handle {
  display: flex;
  justify-content: space-around;
}
.fbuser {
  display: flex;
  font-size: 14px;
  align-items: center;
  .user-ava {
    height: 6vh;
    display: block;
    border-radius: 50%;
  }
}
.zdy-border {
  border-top: 2px solid rgb(230, 230, 230);
  border-bottom: 2px solid rgb(230, 230, 230);
  margin-bottom: 6.5vh;
}
.zdy_btn {
  position: fixed;
  bottom: 15vh;
  right: 5vw;
}
</style>
