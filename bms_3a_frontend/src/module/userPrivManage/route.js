/**
 * author : AZW
 * time : 2020/12/16
 * desc : branch页面
 */
const userPrivManage = r => require.ensure([], () => r(require('./components/userPrivManage.vue')), 'userPrivManage')
const routes = [
  {
    name: 'userPrivManage',
    path: '/userPrivManage',
    component: userPrivManage,
    meta: {breadName: 'userPrivManage', title: '用户权限管理'  , hidden: true ,Ptitle:"用户管理"}
  }
]

export default routes
