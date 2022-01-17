<template>
  <div class="maxbog">
    <div v-if="items" class="bigbox">
      <div class="zdy-border">
        <div class="comment_card">
          <div class="fbuser">
            <!-- 用户头像:src="'http://127.0.0.1:3000/'+items.hpic"   -->
            <img :src="`http://127.0.0.1:3000/${items.art_u_hpic}`" alt="" class="user-ava" />
            <span>&nbsp;&nbsp;{{ items.art_u_name }}</span>
          </div>
          <!-- 文章内容 三行省略显示 -->
          <p class="art_title" @click="gocomm(items.art_id)">
            {{ items.art_title }}
          </p>
          <p class="content" @click="gocomm(items.art_id)">
            {{ items.art_textcontent }}
          </p>
          <!-- 文章图片 -->
          <div>
            <img
              :src="`http://127.0.0.1:3000/${items.art_imgs}`"
              class="arts_img"
              alt=""
              @error="imageLoad"
              @click="gocomm(items.art_id)"
            />
            <p @click="gocomm(items.art_id)" class="time_text">发表时间：{{ zhuanhuanDate(items.art_time) }}</p>
            <!-- 文章操作区 -->
            <div class="handle">
              <!-- 图标加文字  -->
              <div><van-icon name="share-o" size="1.2rem" /></div>
              <div @click="gocomm(items.art_id)"><van-icon name="comment-o" size="1.2rem" />{{ items.art_com_count }}</div>
              <div @click="likeClick(items.art_id, items.l_type, items.art_zan_count)">
                <van-icon v-show="items.l_type == 1" name="like" color="#f00" size="1.2rem" />
                <van-icon v-show="items.l_type == null" name="like" color="gray" size="1.2rem" />
                <span v-if="handle">{{ items.art_zan_count }}</span>
                <span v-else>{{ num }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Toast } from 'vant';
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';

export default {
  props: ['items'],
  data() {
    return {
      uid: '',
      num: 0,
      handle: true,
      type: null,
    };
  },
  mounted() {
    this.num = this.items.art_zan_count;
    this.type = this.items.l_type;
  },
  methods: {
    // 时间戳转换
    zhuanhuanDate: function (value) {
      console.log(value);
      const date = new Date(value);
      console.log('data++++', date);
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
    //跳转到评论页面
    gocomm(art_id) {
      this.$router.push({
        path: `/Artdetails/${art_id}`,
      });
    },
    likeClick(art_id, type, count) {
      if (type == null) {
        this.items.l_type = 1;
        this.num++;
        this.items.art_zan_count++;
        this.uid = JSON.parse(localStorage.getItem('userinfo')).u_id

        // 如果该用户对这个文章的态度不喜欢时，为null，就发送请求把zan_coount+1,以及点赞表里面的type 变为1
        // 1. 发送请求 在点赞表 插入一条新数据  两个参数: -- 点赞对应的文章id  点赞人的uid  type 1
        // 先验证数据库里有没有重复的点赞表  文章id l_art_id  用户id l_uid
        let param = `l_art_id=${art_id}&l_uid=${this.uid}`;
        axios.post('/v1/community/yanzheng', param).then(res => {
          if (res.data.data.length == 0) {
            // 可以插入新的点赞表了
            let value = `l_art_id=${art_id}&l_uid=${this.uid}&l_type=1`;
            axios.post('/v1/community/dianzan2', value).then(res => {
              // 2  发送请求把文章表article的zan_coount+1   发送两个参数：文章id art_id   最终的点赞数量 art_zan_count
              let art_zan_count = count * 1 + 1;
              let params = `art_id=${art_id}&art_zan_count=${art_zan_count}`;
              axios.put('/v1/community/dianzan', params).then(res => {
                this.handle = false;
                Toast('点赞成功');
              });
            });
          } else {
          }
        });
      } else if (type == 1) {
        this.items.l_type = null;
        //删除点赞表的数据
        this.uid = JSON.parse(localStorage.getItem('userinfo')).u_id
        let shanchu = `l_art_id=${art_id}&l_uid=${this.uid}`;
        axios.post('/v1/community/deletezan', shanchu).then(res => {
          // 发送请求把文章表article的zan_coount+1   发送两个参数：文章id art_id   最终的点赞数量 art_zan_count
          let art_zan_count2 = this.num - 1;
          let params = `art_id=${art_id}&art_zan_count=${art_zan_count2}`;
          axios.put('/v1/community/dianzan', params).then(res => {
            this.num--;
            this.items.art_zan_count--;
            this.handle = false;
            Toast('取消点赞');
          });
        });
      }
    },
  },
};
</script>

<style lang="scss" scoped>
// 除了顶部大标题，下面全部都是width：90vw
.art_title {
  font-weight: 900;
  font-size: 1.2rem;
  margin-top: 1.5vh;
}
.content {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3; /*想省略几行就写几*/
  -webkit-box-orient: vertical;
}
.zdy_swiper {
  height: 30vh;
  width: 90vw;
  position: relative;
  margin: 0 auto;
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
  margin-top: 2vh;
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

.bigbox {
  margin-top: 0.5vh;
}
.zdy-border {
  border-top: 2px solid rgb(230, 230, 230);
  border-bottom: 2px solid rgb(230, 230, 230);
}
.time_text {
  font-size: 0.05rem;
}
</style>
