<template>
  <van-nav-bar fixed title="兑换结果"></van-nav-bar>
  <n-result style="margin-top: 8vh" status="success" title="兑换成功">
    <template #footer>
      <n-button @click="$router.push('/')">返回首页</n-button>
    </template>
  </n-result>
</template>
