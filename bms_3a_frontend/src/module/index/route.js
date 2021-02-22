/**
 * author : AZW
 * time : 2020/12/14
 * desc : 管理页面
 */
const manage = r =>
  require.ensure([], () => r(require("./components/main.vue")), "manage");
const routes = [
  {
    name: "manager",
    path: "/manage",
    component: manage,
    meta: { breadName: "管理", title: "欢迎", hidden: true }
  }
];

export default routes;
