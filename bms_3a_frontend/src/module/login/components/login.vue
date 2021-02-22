<template>
  <div class="login-wrapper">
    <div class="logo">
      <p>你好！欢迎来访</p>
      <p>3A集团订单业务管理系统</p>
      <span></span>
    </div>
    <div class="form_wrapper">
      <el-form :model="formData" status-icon :rules="loginRules" ref="loginForm" class="login-form">
        <el-form-item prop="userName" :rules="loginRules.userName">
          <el-input placeholder="请输入用户名" v-model="formData.userName">
            <template slot="prepend">
              <i class="iconfont">&#xe629;</i>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item prop="passWard" :rules="loginRules.passWard">
          <el-input
            type="password"
            placeholder="请输入密码"
            v-model="formData.passWord"
            auto-complete="off"
          >
            <template slot="prepend">
              <i class="iconfont">&#xe63e;</i>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="login" :disabled="btnStatus" style="background:#1080FD;color:#fff;border-radius:30px 30px 30px 30px;">登录系统</el-button>
        </el-form-item>
      </el-form>
       </div>
  </div>
</template>
<script>
import invokers from "../../../invokers";
import storage from "../../../common/js/storage";
import { mapMutations, mapActions } from "vuex";
import axios from "axios";

export default {
  name: "login",
  data() {
    return {
      isCollapse: true, // 控制侧边拦的状态
      btnStatus: false, // 登陆按钮状态
      formData: {
        userName: "",
        passWord: "",
      },
      loginRules: {
        userName: [
          { required: true, message: "用户名不能为空", trigger: "blur" },
          { type: "string", message: "用户名为工号" },
          {
            pattern: /^[A-Za-z0-9\u4e00-\u9fa5]*$/,
            message: "用户名不能含有空格及特殊符号"
          }
        ],
        passWord: [{ required: true, message: "请输入密码", trigger: "blur" }],
      },
    };
  },
  created: function() {
    sessionStorage.clear();
    let theme = storage.cookie.get("theme");
    if (theme) {
      theme = theme.replace(/\\/g, "");
      theme = theme.replace(/\"/g, "");
      this.changeColor(`${theme}`);
    } else {
      this.changeColor("c");
    }
    // 主页添加键盘事件,注意,不能直接在焦点事件上添加回车
    var lett = this;
    document.onkeydown = function(event) {
      var e = event || window.event || arguments.callee.caller.arguments[0];
      if (e && e.keyCode == 13) {
        // enter 键
        lett.login();
      }
    };
  },
  methods: {
    ...mapActions("login", {
      doLoginIn: "DO_LOGIN_IN",
      doLoginOut: "DO_LOGIN_OUT"
    }),
    // 登陆
    login() {
      this.$refs.loginForm.validate(async valid => {
        //console.log(this.formData.rndCode);
        if (valid) {
          let operInfo = {
            userName: this.formData.userName,
            passWord: this.formData.passWord,
          };
          this.Loading("登录中请稍等！")
          let loginInfo = await this.doLoginIn(operInfo);
          console.log("okokok", loginInfo);
          if (Object.prototype.toString.call(loginInfo) === "[object Object]") {
            this.btnStatus = true;
            // this.$router.push("/manage");
            this.$router.push("/QuotationOrderInquiry")
            // this.$message({
            //   message: "登录成功",
            //   type: "success"
            // });
            this.stopLoading();
          } else {
            let msg = loginInfo;
            this.changeCode();
            this.$message({
              message: `${msg}`,
              type: "warning"
            });
          }
          this.$refs.loginForm.resetFields();
        } else {
          if (!this.formData.userName.match(/^[A-Za-z0-9\u4e00-\u9fa5]*$/)) {
            this.$message({
              message: "请输入正确的用户名",
              type: "warning"
            });
          } else if (!this.formData.passWard) {
            this.$message({
              message: "请输入密码",
              type: "warning"
            });
          }
        }
      });
    },
    changeColor(command) {
      let theme = "theme" + command;
      document.getElementById("app").className = theme;
      command.replace(/\\/g, "");
      theme = theme.replace(/\"/g, "");
      storage.cookie.set("theme", `${command}`, { expires: 1 });
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

.el-input {
  width: 365px;

}
.el-form-item{
  .iconfont{
    background: #F7F4FB;
  }
}
.el-form-item:last-child {
  .el-button {
    width: 100%;
    border: 0;
    background: #b82607;
    color: #fff;
    letter-spacing: 3px;
    font-family: "Microsoft YaHei";
  }
}

.el-message-box__wrapper {
  display: none !important;
}

.login-wrapper {
  position: relative;
  width: 100%;
  min-width: 1366px;
  height: calc(100vh);
  background: #fff url(/icmp/static/img/background.png) no-repeat left center;
  background-size: cover;
  .form_wrapper {
    position: absolute;
    top: 66%;
    left: 70%;
    margin-top: -148px;
    height: 270px;
    width: 300px;
    .el-form {
      width: 364px;
      margin-bottom: 100px;
    }
    .login-foot {
      margin-left: -30px;
      text-align: center;
      font-size: 16px;
      color: #999;
    }
  }
  .logo{
    text-align: center;
    color: red;
    font-size: 32px;
    padding-top: 80px;
    p{
      color:#007EFF;
      margin: 0;
      padding: 0;
      line-height: 75px;
      font-size: 32px;
      text-align: left;
      padding-left: 70%;
      font-weight: 700;
    }
    span{
      width: 105px;
      height: 4px;
      background: #007EFF;
      display: block;
      margin-left: 70%;
    }
  }
}

.code-img {
  position: absolute;
  width: 25%;
  height: 39px;
  top: 3px;
  right: 0;
  img {
    width: 100%;
    height: 38px;
    border-radius: 4px;
    background: 95%;
    cursor: pointer;
  }
}
</style>
