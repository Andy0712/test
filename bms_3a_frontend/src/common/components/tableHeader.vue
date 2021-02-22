<template>
  <div class="table-header">
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
    name:'table-header',
    data(){
      return {
        title: '查询条件'
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
.table-header{
  position: relative;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  background: red;
  color: #fff;
  padding: 12px;
  padding-left: 18px;
}
</style>
