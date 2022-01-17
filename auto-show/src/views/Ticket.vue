<template>
 <!-- navbar -->
  <nav-bar class="navItem">
    <template #left>
      <Icon>
        <ChevronBack @click="$router.go(-1)" />
      </Icon>
    </template>
    <template #center>
      <div>我的门票</div>
    </template>
  </nav-bar>
  <n-space vertical class="my_ticket">
    <n-switch v-model:value="qiehuan"  class="my_btn"/>
    <n-card>
      <template #header>
        <n-skeleton text v-if="!qiehuan" width="60%" />
        <template v-else>用户名：{{name}}</template>
      </template>
      <n-skeleton text v-if="!qiehuan" :repeat="6" />
      <template v-else>
        用户ID:{{uid}}<br>
        手机号：{{phone}}
      </template>
       <n-skeleton text v-if="!qiehuan" :repeat="6" />
      <template v-else>
        <img class="my_img" src="https://img1.baidu.com/it/u=2747304127,2546096340&fm=26&fmt=auto">
      </template>
    </n-card>
  </n-space>
</template>

<script>
import NavBar from '../components/NavBar.vue';
import { ChevronBack } from '@vicons/ionicons5';
import { Icon } from '@vicons/utils';
import { defineComponent, onMounted, ref } from "vue";
export default defineComponent({
    components: { ChevronBack, Icon, NavBar },
  setup() {
      const qiehuan = ref(false)
      const name = ref('')
      const uid = ref('')
      const phone = ref('')
      const getdata = ()=>{
          name.value = JSON.parse(localStorage.getItem('userinfo')).name
          uid.value = JSON.parse(localStorage.getItem('userinfo')).u_id
          phone.value = JSON.parse(localStorage.getItem('userinfo')).phone
      }
      onMounted(() => {
      getdata()
    })
    return {
      qiehuan,
      name,
      getdata,
      phone,
      uid
    };
  },
});
</script>

<style scoped>
.navItem {
 background-color: white;
 color: black;
 font-size: 16px;
 position: fixed;
 box-shadow: none;
 top: 0;
 left: 0;
 right: 0;
z-index: 9;
}
.my_ticket{
    margin-top: 8vh;
}
.my_btn{
    position: relative;
    left: 80vw;
}
.my_img{
    width: 60vw;
    position: relative;
    top:3vh;
    display: block;
}
</style>