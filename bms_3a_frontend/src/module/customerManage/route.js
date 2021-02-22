/**
 * author : AZW
 * time : 2021/1/18
 * desc : branch页面
 */
const customerManage = r => require.ensure([], () => r(require('./components/customerManage.vue')), 'customerManage')
const routes = [
  {
    name: 'customerManage',
    path: '/customerManage',
    component: customerManage,
    meta: {breadName: 'customerManage', title: '客户管理'  , hidden: true }
  }
]

export default routes
