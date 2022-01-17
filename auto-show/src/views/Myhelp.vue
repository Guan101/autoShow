<template>
  <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>帮助反馈</div>
    </template>
  </nav-bar>
  <!-- 留言框 -->
  <van-cell-group inset class="textbox">
    <van-field
      v-model="message"
      rows="4"
      size="large"
      label="留言"
      type="textarea"
      maxlength="150"
      placeholder="请输入留言"
      show-word-limit
      border
      clearable
    />
  </van-cell-group>
  <van-button round type="primary" class="subbtn" size="small" @click="submit"
    >提交</van-button
  >
</template>

<script>
import { ref } from "vue";
import NavBar from "../components/NavBar.vue";
import { ChevronBack } from "@vicons/ionicons5";
import { Icon } from "@vicons/utils";
import { Toast } from "vant";
export default {
  components: { ChevronBack, Icon, NavBar },
  setup() {
    const message = ref("");
    const submit = () => {
      console.log(message.value);
      if (message.value) {
        Toast("已提交，感谢您的建议");
        message.value = ''
      }else{
        Toast("内容为空");
      }
    };
    return { message, submit };
  },
};
</script>
<style scoped>
.textbox {
  margin-top: 10vh;
}
.subbtn {
  position: absolute;
  right: 8vw;
  font-size: 3vw;
}
</style>