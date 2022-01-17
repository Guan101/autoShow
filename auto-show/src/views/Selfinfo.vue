<template>
  <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>个人常用信息</div>
    </template>
  </nav-bar>
  <div class="nonebox">
    <n-result status="418" title="暂无数据" description="功能还在实现中...">
      <template #footer>
        <n-button @click="route.push('/')">点我返回首页</n-button>
      </template>
    </n-result>
  </div>
</template>
<script>
import NavBar from "../components/NavBar.vue";
import { ChevronBack } from "@vicons/ionicons5";
import { Icon } from "@vicons/utils";
export default {
  components: { ChevronBack, Icon, NavBar },
  setup() {
    return {};
  },
};
</script>
<style scoped>
.nonebox{
    position: fixed;
    top: 30vh;
    left: 0;
    right: 0;
}
</style>