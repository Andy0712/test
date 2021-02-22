<template>
  <div class="mock-header">

  </div>
</template>
<script>
  export default {
    name:'mock-header',
    data(){
      return {

      }
    },
    props: {

    }
  }
</script>
<style rel="stylesheet/less" lang="less" scoped>
.clearfix{
  zoom:1;
  &:after{
    content: '';
    display: table;
    overflow: hidden;
    clear: both;
  }
}
</style>
