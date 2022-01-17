<template>
  <div class="test">
    <div
      src="https://img1.baidu.com/it/u=2983940918,1423373398&fm=26&fmt=auto"
      name="setting-o"
      is-link
      @click="show"
      class="zdy_tbu"
    ></div>
  </div>
  <van-action-sheet v-model:show="isshow">
    <div class="content">
      <van-collapse v-model="activeName" accordion>
        <van-collapse-item title="上传头像" class="my_hpic">
          <van-uploader v-model="fileList" :after-read="afterRead" multiple> </van-uploader>
          <van-button plain type="primary" round @click="$router.go(0)">确认</van-button>
        </van-collapse-item>
      </van-collapse>
    </div>
  </van-action-sheet>
</template>
<script>
import { ref, inject } from 'vue';
import { Toast } from 'vant';
import axios from 'axios';
import router from '@/router/index.js';

axios.defaults.baseURL = 'http://127.0.0.1:3000';
export default {
  setup() {
    //调用 inject 函数，通过指定的数据名称，获取到父级共享的数据
    const phone = inject('phoneData');
    //下方弹出框
    const activeName = ref('0');
    const isshow = ref(false);
    const show = () => {
      if (localStorage.getItem('userinfo')) {
        isshow.value = true;
      } else {
        Toast('请先登录');
        router.push('/login');
      }
    };
    //上传文件存储服务器
    const afterRead = file => {
      // 此时可以自行将文件上传至服务器
      let filedata = file.file;
      // 确认按钮发送文件到后台
      let fd = new FormData();
      fd.append('uploadFile', filedata);
      fd.append('phone', phone.value);
      axios.post('http://127.0.0.1:3000/upload', fd).then(res => {});
    };
    const fileList = ref([]);

    return {
      phone,
      activeName,
      show,
      afterRead,
      fileList,
      isshow,
    };
  },
};
</script>
<style scoped>
.my_hpic {
  width: 30vw;
}
.zdy_tbu{
  width: 16vw;
  height: 9vh;
  background-color: transparent;
  position: absolute;
  left: 7vw;
  top:5.5vh;
}
</style>
