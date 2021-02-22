/**
 * author : AZW
 * time : 2021/1/18
 * desc : 路由
 * 本模块实现路由控制逻辑
 */
import Vue from "vue";
import VueRouter from "vue-router";
import routes from "./routes";
import storage from "./common/js/storage";
Vue.use(VueRouter);
const router = new VueRouter({
  mode: "history",
  base: "/icmp/",
  routes
});
//路由拦截;
router.beforeEach((to, from, next) => {
  let login = storage.cookie.get("login");
  if (to.path !== "/login" && login !== "true") {
    router.push({ path: "/login" });
  }
  if (to.path == "/icmp" && login !== "true") {
    router.push({ path: "/login" });
  }
  if (to.path == "/" && login == "true") {
    router.push({ path: "/login" });
  }
  if (from.name === null) {
    router.app.$options.store.dispatch("login/fetchAuth");
  }
  if (
    to.path !== "/login" &&
    router.app.$options.store.state.login.loginSuccess === false
  ) {
    router.push({ path: "/login" });
  }
  next();
});
export default router;
