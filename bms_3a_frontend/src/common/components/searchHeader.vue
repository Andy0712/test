<template>
  <!-- 公用查询头部-->
  <div class="search-header">
    <el-row>
      <el-col>
        <i class="el-icon-caret-right"></i>
        <span>{{title}}</span>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  export default {
    name:'search-header',
    data(){
      return {
        title: '查询条件'
      }
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
.search-header {
  position: relative;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  background: #fff;
  padding: 15px;
  padding-left: 18px;
  border-bottom: 1px solid #eee;
}
</style>
