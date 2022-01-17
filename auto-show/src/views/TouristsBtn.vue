<template>
  <div>
    <!-- 用户已存游客信息展示 -->
    <div  v-if="use">
      <!-- 点击判断游客是否被选中进行了购买(游客id，是否选中1选中0未选中) -->
      <div @click="purchase(use.data.t_id,show3)" :class="show3 ? 'isShow' : 'isHid'">
        {{use.data.tname}}
      </div>
    </div>
  </div>
</template>

<script>
import { reactive,ref } from '@vue/reactivity';
export default {
  props:['items'],//获取数据
  emits:['setId'],//获取方法
  setup (data,context) {
    const use = reactive({
      data:data.items.item
    })
    console.log("woshi",data.items.item);
    // 用户是否被选中
    let show3 = ref(false)
    // 点击游客时是否被选中
    let purchase = (id,isShow)=>{
      // console.log(isShow);
      if(isShow){
        show3.value = false
        context.emit('setId',id,show3.value,use.data)
        // console.log(id,show3.value);
      }else{
        show3.value = true
        context.emit('setId',id,show3.value,use.data)
        // console.log(id,show3.value);
      }
      // console.log(isShow);
    }
    return {
      use,purchase,show3
    }
  }
}
</script>

<style lang="scss" scoped>
// 是否被选中的样式
    .isShow{
      background-color: rgb(241, 206, 70);
    }
</style>