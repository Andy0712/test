<template>
  <div class="container" style="height: calc(100vh)">
    <el-container>
      <div class="sidebar_wrapper">
        <el-container>
          <el-aside>
            <app-aside></app-aside>
          </el-aside>
        </el-container>
      </div>
      <div class="main_page_wrapper" style="width: calc(100% - 200px)">
          <el-container>
            <el-header>
              <nav-bar></nav-bar>
            </el-header>
              <el-main :style="{height:screenHeight+'px'}">
                <app-main></app-main>
              </el-main>
          </el-container>
      </div>
    </el-container>
  </div>
</template>
<script>
  import AppAside from './index/components/aside'
  import NavBar from './index/components/navBar'
  import AppMain from './index/components/main'
  export default {
    name:'container',
    data(){
      return {
        screenHeight:document.body.clientHeight-146,
      }
    },
    mounted () {
      this.screenHeight = document.body.clientHeight-146
      window.onresize = () => {
        return (() => {
          window.clientHeight = document.body.clientHeight
          this.screenHeight = document.body.clientHeight-146
        })()
      }
    },
    components:{
      NavBar,
      AppMain,
      AppAside
    },
    watch:{
      screenHeight (val) {
        this.screenHeight = val
      }
    }
  }
</script>
<style rel="stylesheet/less" lang="less" scoped>
  .sidebar_wrapper{
    width: 200px;
    .el-aside {
      background-color: #d4d4d6;
      color: #333;
      width: 200px !important;
      text-align: center;
      border-right: 1px solid #dfdfdf;
    }
  }

  .main_page_wrapper{
    flex: 1;
    .el-header {
      height: 100px !important;
      padding: 0;
    }
    .el-main {
      padding: 0 !important;
      background: #eeeeee;
    }
  }

</style>
