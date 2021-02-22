/**
 * author : AZW
 * time : 2020/12/12
 * desc : branch页面
 */
const RolePerManage = r => require.ensure([], () => r(require('./components/RolePerManage.vue')), 'RolePerManage')
const routes = [
  {
    name: 'RolePerManage',
    path: '/RolePerManage',
    component: RolePerManage,
    meta: {breadName: 'RolePerManage', title: '角色权限管理'  , hidden: true ,Ptitle:"用户管理"}
  }
]

export default routes
