<template>
  <div class="app-wrapper">
    <!-- <keep-alive> -->
      <router-view></router-view>
    <!-- </keep-alive> -->
  </div>
</template>
<script>
  export default {
    name:'app-wrapper'
  }
</script>
<style rel="stylesheet/less" lang="less" scoped>
  .app-wrapper{
    width: 100%;
  }
</style>
