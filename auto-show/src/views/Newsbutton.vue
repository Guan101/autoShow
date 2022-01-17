<template>
  <div>
    <van-nav-bar title="我的文章" left-text="返回" left-arrow @click-left="$router.go(-1)" />
    <n-space vertical class="zdy_box">
      <n-input maxlength="60" placeholder="添加标题" show-count clearable v-model:value="title" @change="gettitle" />
      <n-input
        placeholder="点击输入正文,您可在此交流买车用车经验,分享有车生活"
        type="textarea"
        size="small"
        :autosize="{
          minRows: 3,
          maxRows: 6,
        }"
        v-model:value="content"
        @change="getcontent"
      >
        {{ value.includes('哦') ? '99+' : value.length }}
      </n-input>
      <!-- //上传图片 -->
      <van-uploader v-model="fileList" :after-read="afterRead" multiple show-upload> </van-uploader>
      <button @click="submit">确定</button>
    </n-space>
  </div>
</template>

<script>
import { ref } from 'vue';
import router from '@/router/index.js';
import axios from 'axios';
import { Toast } from 'vant';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
import { inject } from 'vue';
export default {
  setup() {
    const reload = inject('reload');
    let uname = ref();
    let hpic = '';
    let filedata = '';
    let title = ref('');
    const gettitle = () => {};
    let content = ref('');
    const getcontent = () => {};
    //上传文件存储服务器
    const afterRead = file => {
      // 此时可以自行将文件上传至服务器
      filedata = file.file;
      return filedata;
    };
    const submit = () => {
      if (!content.value == '') {
        let uid = JSON.parse(localStorage.getItem('userinfo')).u_id;
        // 通过id拿到用户名, 头像
        let params = `u_id=${uid}`;
        axios.post('/user/getinfo', params).then(res => {
          hpic = res.data.result.hpic;
          uname = res.data.result.u_name;
          let currentDate = new Date().getTime();
          let fd = new FormData();
          fd.append('uploadFile2', filedata); //图片文件
          fd.append('title', title.value); //标题
          fd.append('currentDate', currentDate); //时间
          fd.append('content', content.value); //内容
          fd.append('uid', uid); //用户id
          fd.append('uname', uname); //用户名字
          fd.append('hpic', hpic); //用户头像
          axios.post('http://127.0.0.1:3000/upload2', fd).then(res => {});
          Toast('发表成功');
          //刷新页面
          router.push('/news');
          reload();
        });
      } else {
        Toast('发表内容不可为空');
      }
    };

    const fileList = ref([]);
    return {
      afterRead,
      fileList,
      title,
      gettitle,
      getcontent,
      content,
      submit,
      filedata,
      uname,
      hpic,
      reload,
    };
  },
};
</script>

<style lang="scss">
.zdy_box {
  width: 90vw;
  margin: 0 auto;
}
</style>
