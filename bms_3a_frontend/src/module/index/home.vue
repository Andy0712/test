<template>
  <div class="home" :style="{height:screenHeight+'px'}">
    <div class="views">
      <span class="time">今天是 &nbsp;{{nowDate}}</span>
      <p class="welcome">3A集团订单业务管理系统</p>
    </div>
  </div>
</template>
<script>
import { mapActions } from "vuex";

export default {
  name: "home",
  data() {
    return {
      screenHeight: document.body.clientHeight - 147,
      loginTimeoutDialog: false,
      nowDate: ""
    };
  },
  mounted() {
    this.screenHeight = document.body.clientHeight - 147;
    window.onresize = () => {
      return (() => {
        window.clientHeight = document.body.clientHeight;
        this.screenHeight = document.body.clientHeight - 147;
      })();
    };
  },
  created() {
    this.nowDate = this.getNowDate();
  },
  beforeRouteEnter(to, from, next) {
    next(async vm => {
      vm.getDropList();
    });
  },
  methods: {
    ...mapActions("createMeasure", {
      queryDeptType: "queryDeptType" // 基本法下拉数据的获
    }),
    async getDropList() {
      let ret = await this.queryDeptType();
      if (Object.prototype.toString.call(ret) === "[object Array]") {
        return ret;
      }
      return false;
    },
    getNowDate() {
      let interval = window.setInterval(() => {
        let date = new Date();
        let year = date.getFullYear(); //当前年份
        let month = date.getMonth(); //当前月份
        let data = date.getDate(); //天
        let hours = date.getHours(); //小时
        let minute = date.getMinutes(); //分
        let second = date.getSeconds(); //秒
        this.nowDate =
          year +
          "年" +
          this.fnW(month + 1) +
          "月" +
          this.fnW(data) +
          "日" +
          this.fnW(hours) +
          ":" +
          this.fnW(minute) +
          ":" +
          this.fnW(second);
        return this.nowDate;
      }, 1000);
    },
    fnW(str) {
      let num;
      str > 9 ? (num = str) : (num = "0" + str);
      return num;
    }
  }
};
</script>
<style rel="stylesheet/less" lang="less" scoped>
.home {
  position: relative;
  width: 100%;
  background: url("/icmp/static/img/home.jpg") no-repeat center;
  background-size: 100%;
  .views {
    position: absolute;
    left: 150px;
    bottom: 100px;
    .time {
      display: block;
      font-size: 24px;
      color: #e8340c;
      margin-bottom: 18px !important;
    }
    .welcome {
      font-size: 38px;
      margin: 0;
      color: #e8340c;
    }
  }
}
</style>
