/**
 * author : AZW
 * time : 2020/12/18
 * desc : branch页面
 */
const branch = r => require.ensure([], () => r(require('./components/branch.vue')), 'branch')
const routes = [
  {
    name: 'branch',
    path: '/branch',
    component: branch,
    meta: {breadName: 'branch', title: 'branch维护'  , hidden: true ,Ptitle:"用户管理"}
  }
]

export default routes
