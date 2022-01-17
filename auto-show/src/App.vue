<template>
  <div>
    <router-view v-if="state.showRouter"/>
  </div>
</template>

<script>
import { defineComponent, nextTick, provide, reactive } from 'vue'
export default defineComponent({
  setup() {
    const state = reactive({
      showRouter: true,
    })
    function reload() {
      state.showRouter = false
      nextTick(() => {
        state.showRouter = true
      })
    }
    provide('reload', reload)
    return {
      state,
    }
  },
})
</script>
