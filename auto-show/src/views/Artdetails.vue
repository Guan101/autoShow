<template>
  <div>
    <van-nav-bar fixed title="详情" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <!-- 下方内容部分 -->
    <div class="artbox">
      <!-- 文章顶部 头像 作者名，发表时间  -->
      <div class="arttop">
        <div>
          <img class="artava" :src="`http://127.0.0.1:3000/${art_u_hpic}`" alt="" />
        </div>
        <div class="zdy_text">
          <span>{{ art_u_name }}</span
          >{{ zhuanhuanDate(art_time) }}<span></span>
        </div>
      </div>
      <!-- 文章正文部分加图片 -->
      <div class="art_content">
        <div>
          <p>{{ art_title }}</p>
          <p>{{ art_textcontent }}</p>
        </div>
        <div>
          <img class="contentimg" :src="`http://127.0.0.1:3000/${art_imgs}`" alt="" />
        </div>
      </div>
    </div>
    <!-- 评论部分 -->
    <div class="art_comm">
      <div class="title_hr">全部评论</div>
      <!-- 循环评论卡片 -->
      <div v-if="`${comment_data}`">
        <div class="com-top" v-for="(item, index) in comment_data" v-bind:index="index" :key="index">
          <div>
            <img class="com_avar" :src="`http://127.0.0.1:3000/${item.hpic}`" alt="" />
          </div>
          <!-- 下方评论的用户 -->
          <div class="comm_content">
            <span>{{ item.u_name }}</span>
            <!-- 评论 -->
            <!-- 为评论绑定点击评论事件 -->
            <span>{{ item.comm_content }}</span>
            <span>{{ zhuanhuanDate(item.comm_time) }}</span>
            <!-- 下方回复的 -->
            <div class="reply" v-for="reply in item.reply" :key="reply.time">
              <b
                >{{ reply.responder }}&nbsp;&nbsp;回复&nbsp;&nbsp;{{ reply.reviewers }}
                <!-- <span>{{ reply.time }}</span> -->
                <p>{{ reply.content }}</p>
              </b>
            </div>
          </div>
        </div>
      </div>
      <div v-else class="comm_none">暂无评论</div>
    </div>
    <!-- 下方固定操作部分 -->
    <div class="handlebox">
      <input ref="comments" type="text" class="zdy_input" placeholder="说点什么..." />
      <button @click="showinput">确定</button>
      <div>
        <van-icon size="1.2rem" name="comment-circle-o" /><span>{{ art_com_count }}</span>
      </div>
      <div @click="likeClick">
        <van-icon size="1.2rem" name="thumb-circle-o" /><span>{{ art_zan_count }}</span>
      </div>
      <div><van-icon size="1.2rem" name="share-o" /><span class="iaconitems">分享</span></div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { Toast } from 'vant';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
import { inject } from 'vue';
export default {
  inject: ['reload'],
  data() {
    return {
      commshow: false,
      initdata: '',
      art_imgs: '',
      art_textcontent: '',
      art_time: '',
      art_u_name: '',
      art_title: '',
      art_u_hpic: '',
      art_com_count: '',
      art_zan_count: '',
      comment_data: '',
    };
  },
  methods: {
    // 回复评论
    subreply() {},
    //显示输入框
    isShow(index) {
      let _el = this.$refs.chenbushui[index]; //	通过下标找到对应同级节点
      console.log(_el);
      if (_el.getAttribute('class') === 'active') {
        _el.setAttribute('class', '');
      } else {
        _el.setAttribute('class', 'active');
      }
    },

    // 时间戳转换
    zhuanhuanDate: function (value) {
      const date = new Date(value);
      let Y = date.getFullYear();
      let M = date.getMonth() + 1;
      let d = date.getDate();
      let h = date.getHours();
      let i = date.getMinutes();
      let s = date.getSeconds();
      if (M < 10) {
        M = '0' + M;
      }
      if (d < 10) {
        d = '0' + d;
      }
      if (h < 10) {
        h = '0' + h;
      }
      if (i < 10) {
        i = '0' + i;
      }
      if (s < 10) {
        s = '0' + s;
      }
      const t = Y + '-' + M + '-' + d + ' ' + h + ':' + i + ':' + s;
      return t;
    },
    addcount() {
      //再把数据库文章表的评论加1
      let count = this.art_com_count * 1 + 1;
      let art_id = this.$route.params.art_id;
      let param = `art_id=${art_id}&art_com_count=${count}`;
      axios.put(`/v1/community/commentnum`, param).then(res => {});
    },
    showinput() {
      let comments = this.$refs.comments.value;
      if (!comments == '') {
        this.$refs.comments.value = '';
        let art_id = this.$route.params.art_id;
        // 发文章时间
        let comm_time = new Date().getTime();
        let comm_from_uid = JSON.parse(localStorage.getItem('userinfo')).u_id;
        let params = `comm_art_id=${art_id}&comm_from_uid=${comm_from_uid}&comm_content=${comments}&comm_time=${comm_time}`;
        axios.post(`/v1/community/insertcomments`, params).then(res => {
          Toast('评论成功');
          this.addcount();
          this.reload();
        });
      } else {
        Toast('输入内容不能为空');
      }
    },
    getinfo() {
      // 该篇文章id
      let art_id = this.$route.params.art_id;
      // 发送请求初始化拿到页面显示的内容
      let params = `art_id=${art_id}`;
      axios.post(`/v1/community/artsdetails`, params).then(res => {
        this.initdata = res.data.data;
        this.art_imgs = res.data.data[0].art_imgs;
        this.art_textcontent = res.data.data[0].art_textcontent;
        this.art_u_name = res.data.data[0].art_u_name;
        this.art_time = res.data.data[0].art_time;
        this.art_title = res.data.data[0].art_title;
        this.art_u_hpic = res.data.data[0].art_u_hpic;
        this.art_com_count = res.data.data[0].art_com_count;
        this.art_zan_count = res.data.data[0].art_zan_count;
      });
    },
    getcomment() {
      let art_id = this.$route.params.art_id;
      let params = `comm_art_id=${art_id}`;
      axios.post(`/v1/community/getcom`, params).then(res => {
        // this.comment_data = res.data.data;
        this.comment_data = res.data.data;
        console.log(this.comment_data);
      });
    },
  },
  mounted() {
    this.getcomment();
    this.getinfo();
  },
  // updated() {
  //   this.addcount();
  // },
};
</script>

<style lang="scss" scoped>
.active {
  display: none;
}
.artbox {
  width: 90vw;
  background-color: rgb(230, 243, 241);
  margin: 0 auto;
  margin-top: 9vh;
  .arttop {
    height: 10vh;
    display: flex;
    align-items: center;
    .artava {
      display: block;
      width: 12vw;
      border-radius: 50%;
    }
  }
}
.zdy_text {
  display: flex;
  flex-direction: column;
  font-size: 0.2rem;
}
// 评论的正文部分
.art_content {
  .contentimg {
    width: 100%;
    display: block;
  }
}
.art_comm {
  width: 90vw;
  margin: 0 auto;
  margin-bottom: 10vh;
  background-color: rgb(230, 243, 241);
}
.com_avar {
  width: 9vw;
  border-radius: 50%;
}
.com-top,
.comm_none {
  display: flex;
  margin-top: 3vh;
}
.comm_content {
  display: flex;
  flex-direction: column;
}
.title_hr {
  padding-top: 2vh;
}
.handlebox {
  width: 90vw;
  height: 6vh;
  position: fixed;
  bottom: 0;
  left: 5vw;
  right: 5vw;
  display: flex;
  justify-content: space-around;
  align-items: center;
  background-color: white;
}
.zdy_input {
  height: 70%;
  width: 40%;
  border-radius: 0.1rem;
  outline: none;
  border: 0.5px solid rgb(179, 176, 176);
}
.iaconitems {
  font-size: 0.8rem;
}
</style>
