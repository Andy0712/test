/**
 * author : AZW
 * time : 2020/12/18
 * desc : branch页面
 */
const management = r => require.ensure([], () => r(require('./components/management.vue')), 'management')
const routes = [
  {
    name: 'management',
    path: '/management',
    component: management,
    meta: {breadName: 'management', title: '角色管理'  , hidden: true ,Ptitle:"用户管理"}
  }
]

export default routes
