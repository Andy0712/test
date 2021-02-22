<template>
  <div class="aside-wrapper">
    <div class="logo">
      <p style="font-weight: 700;margin:0;line-height:30px">3A集团</p>      
      <p style="margin:0;line-height:30px">订单业务管理系统</p> 
    </div>
    <el-scrollbar class="sidebar_nav">
      <!-- <div class="aside"> -->
        <el-row class="tac">
          <el-col>
            <el-menu  class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :unique-opened='true'>
              <el-submenu v-for="(item,index) in MENU" :key="index" :index='index'  :class="{'OpenColor':menu_name == item.menu_name}">
                <template slot="title">
                  <i class="el-icon-location navside1"></i>
                  <span slot="title" class="navside1">{{item.menu_name}}</span>
                </template>
                <el-menu-item-group v-for="(obj,i) in item.child" :key='i' :class="{'bcolor':menu_name == item.menu_name,'present':activeName == obj.menu_name}">
                  <template slot="title">
                    <span slot="title" @click="goPath(obj)" class='navside' style=" line-height: 30px;">{{obj.menu_name}}</span>
                  </template>
                </el-menu-item-group>
              </el-submenu>
            </el-menu>
          </el-col>
        </el-row>
      <!-- </div> -->
    </el-scrollbar>
  </div>
</template>
<script>
import { mapMutations } from "vuex";
import storage from "../../../common/js/storage";
export default {
  name: "aside-wrapper",
  data() {
    return {
      menuList: [], //  菜单对象
      userRole: "", // 用户角色
      userName: "", //   用户id
      activeName: "",
      step_status: 1,
      path: "", //默认路径
      navArr: [],
      menu_name:'',
      MENU : [
  { menu_name:"用户管理",child:[
    {menu_name:"branch维护",path:"branch"},
    {menu_name:"用户管理",path:"userManage"},
    {menu_name:"角色管理",path:'management'},
    {menu_name:"角色权限管理",path:"RolePerManage"},
    {menu_name:"用户权限管理",path:"userPrivManage"},
  ]},
  {menu_name:"销售管理",child:[
    {menu_name:"报价单及订单查询",path:"QuotationOrderInquiry"},
    {menu_name:"产品服务定义",path:""},
    {menu_name:"生产确认处理",path:""},
    {menu_name:"超权限审批处理",path:""},
    {menu_name:"简易业务处理",path:""},
    {menu_name:"欠费情况查询",path:""},
  ]},
  
  {menu_name:"生产单管理",child:[
    {menu_name:"待分配订单查询",path:""},
    {menu_name:"生产单分配",path:""},
    {menu_name:"生产单处理",path:""},
    {menu_name:"生产单处理",path:""},
    {menu_name:"库存管理和入库管理",path:""},
    {menu_name:"库存管理和入库管理",path:""},
    {menu_name:"业务回退",path:""},
  ]},
  {menu_name:"财务管理",child:[
    {menu_name:"定金管理",path:""},
    {menu_name:"缴费管理",path:""},
    {menu_name:"invoice管理",path:"invoiceManage"},
  ]},
  {menu_name:"客户管理",child:[
    {menu_name:"客户管理",path:"customerManage"}
  ]},
  {menu_name:"库存维护",child:[
    {menu_name:"库存维护",path:"inventoryMaintenance"}
  ]},
  {menu_name:"信息查询管理",child:[
    {menu_name:"应收应付查询",path:"receipts"},
    {menu_name:"订单查询",path:"orderInquiry"},
    {menu_name:"生产任务查询",path:"ProductionTask"},
    {menu_name:"客户信息查询",path:"customerInfor"},
  ]},
] // 导航数组
    };
  },
  created() {
    // 获取动态菜单
    // let menu =storage.locals.get("menuList");
    this.menuList = this.MENU;
    this.activeName = this.$route.meta.title;
    this.menu_name = this.$route.meta.Ptitle;
    let userInfo = storage.locals.get("userInfo");
    this.userRole = userInfo.roleName;
    this.userName = userInfo.userName;
    // try {
     
    //   debugger
    // } catch (err) {
    //   // this.$router.push({path : '/login'})
    // }
  },
  methods: {
    goPath(item) {
      this.activeName = item.menu_name;
      this.$router.push({ path: `${item.path}` });
    },
    gohome() {
      this.$router.push({ name: "Home" });
    },
    showList(index){
      this.itemIndex = index;
    },
    handleOpen(key, keyPath) {
      this.itemIndex = key;
      this.menu_name = this.MENU[key].menu_name;
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    }
  },
  watch: {
    $route(to, from) {
      this.activeName = to.meta.title;
      this.menu_name = to.meta.Ptitle;
    }
  }
};
</script>
<style rel="stylesheet/less" lang="less" scoped>
.el-menu--collapse{
  background: #eee;
}
 .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    min-height: 400px;
    color: #666666;
    // background: #d4d4d6;
    .navside{
      position: relative;
      padding-left: 20px;
      color: #909399;
    }
    .navside:hover{
      cursor: pointer;
      // color:cornflowerblue;
    }
    .navside::before{
        content:"";
        width:2px;
        height: 10px;
        position: absolute;
        left: 0;
        top: 3px;
        background: #909399;
      }

    .el-submenu{
      text-align: left;
    }
    .OpenColor{
      background: #007EFF;
      .navside1{
       color: #fff;
      }
      i{
        color:#fff;
      }
    }
    .bcolor{
      background: #EDF6FF;
      span{
        color:#007EFF;
        position: relative;
        padding-left: 20px;
      }
      span::before{
        content:"";
        width:2px;
        height: 10px;
        background: #007EFF;
        position: absolute;
        left: 0;
        top: 3px;
      }
    }
    .present{
      background: mediumturquoise;
      span{
        color:#fff;
        position: relative;
        padding-left: 20px;
      }
      span::before{
        content:"";
        width:2px;
        height: 10px;
        background: #fff;
        position: absolute;
        left: 0;
        top: 3px;
      }
    }
  }

.aside-wrapper {
  width: 100%;
  height: 100%;
  // position: relative;
  .sidebar_nav {
    // position: fixed;
    top: 0;
    bottom: 0;
    // width: 200px;
    // margin-top: 146px;
  }
  .el-scrollbar {
    .el-scrollbar__wrap {
      overflow-x: auto;
    }
  }
  .logo {
    width: 100%;
    // height: 100px;
    line-height: 50px;
    background: #007EFF;
    color: #fff;
    border-bottom: 1px solid #fff;
    padding:10px 0;
  }
   el-menu-item-group{
    span:hover{
      cursor: pointer;
    }
  }
}
</style>
