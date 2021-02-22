/**
 * author : AZW
 * time : 2020/12/15
 * desc : branch页面
 */
const userManage = r => require.ensure([], () => r(require('./components/userManage.vue')), 'userManage')
const routes = [
  {
    name: 'userManage',
    path: '/userManage',
    component: userManage,
    meta: {breadName: 'userManage', title: '用户管理'  , hidden: true ,Ptitle:"用户管理"}
  }
]

export default routes
