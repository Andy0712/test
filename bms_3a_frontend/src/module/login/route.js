/**
 * author : AZW
 * time : 2020/12/8
 * desc : 登录路由界面
 */
const login = r => require.ensure([], () => r(require('./components/login.vue')), 'login')
const routes = [
  {
    name: 'loin',
    path: '/login',
    component: login,
    meta: {breadName: '登录', title: '3A集团订单业务管理系统'  , hidden: true }
  }
]

export default routes
