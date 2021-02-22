<template>
  <div class="nav-wrapper">
    <div class="header-nav">
      <div class="nav" style="width:calc(100% - 150px)" ref="navWrapper">
        <el-button class="left" @click="handleLeft">
          <i class="iconfont">&#xe6d0;</i>
        </el-button>
        <div class="nav-content clearfix" ref="nav" >
          <div style="height:40px">
            <router-link
              ref="tag"
              v-for="(item ,index) in Array.from(viewlist)"
              :key="index"
              :to="item.path"
              :class="isActive(item)?'Color': 'error'"
            >
              {{item.title}}
              <span
                class="el-icon-close"
                @click.prevent.stop="handleTagClose(item)"
              ></span>
            </router-link>
          </div>
        </div>
        <el-button class="right" @click="handleRight">
          <i class="iconfont">&#xe6c9;</i>
        </el-button>
      </div>
      <div class="drop-down">
        <el-dropdown trigger="click" @command="deleteHandle">
          <span class="user">
            {{User.roleName}}
            <i class="el-icon-arrow-down el-icon--right"></i>
          </span>
          <el-dropdown-menu slot="dropdown">
             <el-button class="login-out" size="mini" @click="doLoginOut">
              <i class="iconfont" style="font-size:14px;">&#xe652;</i> 退出
            </el-button>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <!-- <p class="mock changeColor"></p> -->
    <div class="breadcrumb">
      <el-breadcrumb>
        <el-breadcrumb-item>
          <i class="el-icon-location-outline" style="margin-right: 12px;"></i>当前位置
        </el-breadcrumb-item>
        <el-breadcrumb-item>
          {{menu_name}}
        </el-breadcrumb-item>
        <!-- <el-breadcrumb-item :to="{ path: '/' }">{{title}}</el-breadcrumb-item> -->
        <el-breadcrumb-item><strong>{{title}}</strong></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters, mapMutations } from "vuex";
import storage from "../../../common/js/storage";
export default {
  name: "nav-wrapper",
  data() {
    return {
      title: "", // 标题
      theme: document.cookie,
      right: "",
      routeName: "",
      menu_name:"",
      left:-20,
      viewList:"",
      User:""
    };
  },
  created() {
    this.title = this.$route.meta.title;
    this.menu_name = this.$route.meta.Ptitle;
    var sthidden = this.$route.meta.hidden;
    this.routeName = this.$route;
    let theme = storage.cookie.get("theme");
    this.User = JSON.parse(sessionStorage.getItem("userInfo"));
    if (theme) {
      theme = theme.replace(/\\/g, "");
      theme = theme.replace(/\"/g, "");
      this.changeColor(`${theme}`);
    } else {
      this.changeColor("c");
    }
  },
  computed: {
    viewlist() {
      this.viewList = this.$store.state.index.viewList;
      return this.$store.state.index.viewList;
    }
  },
  mounted() {
    this.addViewsTags();
  },
  methods: {
    ...mapActions("login", {
      loginOut: "DO_LOGIN_OUT"
    }),
    changeColor(command) {
      let theme = "theme" + command;
      document.getElementById("app").className = theme;
      command.replace(/\\/g, "");
      theme = theme.replace(/\"/g, "");
      storage.cookie.set("theme", `${command}`, { expires: 1 });
    },
    // 执行登出操作
    doLoginOut() {
      // let ret = await this.loginOut();
      // if (ret === 200) {

        sessionStorage.clear();
        this.$router.push("/login");
        // this.$message({
        //   message: "退出成功",
        //   type: "success"
        // });
        
      // } else {
      //   this.$message({
      //     message: `${ret.msg}`,
      //     type: "warning"
      //   });
      // }
    },
    // 点击小图标关闭操作
    handleTagClose(item) {
      this.$store.commit("index/DEL_VIEWS_LIST", item);
      const latestView = this.$store.state.index.viewList.slice(-1)[0];
      if (latestView) {
        this.$router.push(latestView.path);
      } else {
        // this.$router.push('/')
        return;
      }
    },
    // 获取当前路径的信息
    getCurrentRoute() {
      if (this.$route.name) {
        return this.$route;
      }
      return false;
    },
    // 变成当先的显示
    isActive(route) {
      return this.$route.meta.title === route.title;
    },
    // 关闭其他
    deleteHandle(row) {
      if (row === "All") {
        // this.$store.commit('index/DEL_ALL_VIEWS_LIST',this.routeName)
        this.$store.commit("index/DEL_OTHER_VIEWS", this.routeName);
        // this.$router.push('/')
      } else if (row === "Other") {
        const routeView = this.getCurrentRoute();
        this.$store.commit("index/DEL_OTHER_VIEWS", routeView);
      }
      return false;
    },
    // 增加视图导航函数
    addViewsTags() {
      const routeView = this.getCurrentRoute();
      if (!routeView) {
        return false;
      }
      if (
        routeView.name === "basicMeassage" ||
        routeView.name === "filsCreate" ||
        routeView.name === "ruleSet"
      )
        return;
      this.$store.commit("index/ADD_VIEWS_LIST", routeView);
    },
    handleRight() {
      for(let i = 0;i<this.viewlist.length;i++){
        if(this.viewlist[i].title == this.title){
          if(this.viewlist[i+1]){
            this.title = this.viewlist[i+1].title;
            // this.isActive(this.viewlist[i+1]);
            this.$router.push({ path: `${this.viewlist[i+1].path}` });
          }
          return false;
        }
      }
    },
    handleLeft() {
      for(let i = 0;i<this.viewlist.length;i++){
        if(this.viewlist[i].title == this.title){
          if(this.viewlist[i-1]){
            this.title = this.viewlist[i-1].title;
            // this.isActive(this.viewlist[i-1]);
            this.$router.push({ path: `${this.viewlist[i-1].path}` });
          }
          return false;
        }
      }
    }
  },
  watch: {
    $route(to, from) {
      this.title = to.meta.title;
      this.menu_name = to.meta.Ptitle;
      if (
        to.name === "basicMeassage" ||
        to.name === "filsCreate" ||
        to.name === "detail"
      )
        return;
      this.addViewsTags();
    }
  }
};
</script>
<style rel="stylesheet/less" lang="less" scoped>
.clearfix {
  zoom: 1;
  &:after {
    content: "";
    display: table;
    overflow: hidden;
    clear: both;
  }
}
.el-button {
  border: 0;
}
.error {
  color: #666666;
}
a {
  color: #fff;
}
.user:hover{
  cursor: pointer;
}
.el-dropdown{
  color: #007EFF;
} 
.Color {
  background:#007EFF;
  color: #fff !important;
  border-right: 1px solid #d4d5d7;
}
.el-dropdown-link {
  cursor: pointer;
  color: #fff;
  line-height: 60px;
}
.el-tag {
  border-radius: 0px;
  border: 0;
}
.nav-wrapper {
  width: 100%;
  box-sizing: border-box;
  .title-info {
    // 头部信息
    position: relative;
    width: 100%;
    box-sizing: border-box;
    padding-left: 22px;
    height: 60px;
    color: #fff;
    line-height: 60px;
    background: red;
    font-size: 24px;
    .el-row {
      height: 60px !important;
      .el-col {
        height: 60px !important;
      }
    }
  }
}
.header-nav {
  width: 100%;
  position: relative;
  box-sizing: border-box;
  height: 40px;
  line-height: 40px;
  font-size: 14px;
  background: #e6e8ea;
  .el-row {
    height: 40px;
  }
  .nav {
    height: 100%;
    width: calc(100% - 150px);
    position: absolute;
    right: 95px;
    top: 0;
    .el-button {
      border-radius: 0;
      height: 40px;
      padding: 12px 12px;
    }
    .left {
      position: absolute;
      top: 0;
      left: -55px;
      background: #e5e7e9;
      border-right: 1px solid #bfbfbf;
      z-index: 1;
    }
    .right {
      position: absolute;
      top: 0px;
      right: 0px;
      background: #e5e7e9;
      border-right: 1px solid #bfbfbf;
      border-left: 1px solid #bfbfbf;
      z-index: 1;
    }
    .nav-content {
      position: absolute;
      top: 0;
      left: -20px;
      height: 40px;
      overflow: hidden;
      white-space: nowrap;
      a {
        font-size: 12px;
        display: inline-block;
        position: relative;
        padding: 1px 8px !important;
        height: 40px;
        text-decoration: none;
        line-height: 40px;
        span {
          margin-left: 3px;
        }
        span:hover {
          width: 12px;
          height: 12px;
          border-radius: 50%;
          line-height: 12px;
          background: #bfbfbf;
        }
      }
    }
  }
  .drop-down {
    width: 95px;
    position: absolute;
    border-left: 1px solid #bfbfbf;
    top: 0;
    right: 0px;
    background: #e7e8ea;
    text-align: center;
    z-index: 1;
  }
  .login-out {
    position: absolute;
    height: 40px;
    width: 60px;
    right: 0;
    top: 0;
    padding-left: 8px;
    text-align: left;
    border-radius: 0px;
    border-left: 1px solid #bfbfbf;
    background: #e7e8ea;
    z-index: 1;
  }
}

.mock {
  height: 2px;
  margin: 0;
  background: red;
}
.breadcrumb {
  box-sizing: border-box;
  height: 44px !important;
  padding-left: 34px;
  line-height: 60px;
  display: flex;
  justify-content: space-between;
  .el-breadcrumb {
    line-height: 60px;
    // height: 44px;
    font-size: 14px;
  }
}
.el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
  .demonstration {
    display: block;
    color: #8492a6;
    font-size: 14px;
    margin-bottom: 20px;
  }
</style>
