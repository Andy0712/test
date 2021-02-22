<template>
  <div class="nofound">
    <p class="nofound-img">
      <img src="../../static/img/404.png"/>
    </p>
    <p class="notice-txt">出错啦！您访问的页面不存在！</p>
    <p class="query-btn">
      <el-button  @click="gohome">返回首页</el-button>
    </p>
  </div>
</template>

<script>
  export default {
    data() {
      return {

      }
    },
    methods: {
      gohome() {
        this.$router.push({
          path: '/'
        })
      }
    }
  }
</script>
<style rel="stylesheet/less" lang="less"  scoped >
  .nofound {
    background: #fff;
    margin: 0 20px;
    min-height: 600px;
    .nofound-img {
      width: 180px;
      margin: 0 auto;
      padding-top: 200px;
      img {
        width: 180px;
      }
    }
    .notice-txt {
      padding: 25px 0 20px;
      font-size: 18px;
      color: #000;
      text-align: center;
      line-height: 26px;
      margin: 0;
    }
    .query-btn {
      text-align: center;
      .el-button {
        border: 0;
        &:hover{
          color: #626365;
          background-color: #ffffff;
        }
      }
    }
  }

</style>
