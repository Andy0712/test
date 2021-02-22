/**
 * Author: AZW
 * Date: 2020/12/8
 * Desc: 项目起步
 **/
import Vue from 'vue'
import App from './App'
import router from './router'
import 'normalize.css/normalize.css'// A CSS resets
import {sync} from 'vuex-router-sync'
import store from './store'
import _ from 'lodash'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/style/css/index.less'
import 'babel-polyfill'
import './../static/iconfont/iconfont.css'
import storage from "./common/js/storage";
import echarts from 'echarts'

Vue.prototype.$echarts = echarts
Vue.config.productionTip = false;
Vue.config.debug = true;
Vue.use(ElementUI);
Vue.prototype.loading;
Vue.prototype.loginTimeout = function () {
  // debugger

  // this.$store.dispatch('login/DO_LOGIN_OUT');
  // console.log(storage.locals.get('loginTimeout'));
  localStorage.clear();
  // if (storage.locals.get('loginTimeout')) {
    // debugger
    this.$message({
      message: '登录超时,请重新登录',
      type: 'warning'
    });
  // }
  this.$router.push({path: '/login'});
  // storage.locals.set('loginTimeout', false)
};
// let loading;
Vue.prototype.Loading = function(text){
  this.loading = this.$loading({
    lock: true,
    text: text,
    spinner: 'el-icon-loading',
   // background: 'rgba(0, 0, 0, 0.7)'
  });
}
Vue.prototype.stopLoading = function(){
  this.loading.close();
}
//路由状态同步到store 中去
sync(store, router)
const app = new Vue({
  router,
  store,
  render(h) {
    return h(App)
  }
})
app.$mount('#app')



