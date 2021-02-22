/**
 * author : AZW
 * time : 2020/12/18
 * desc : branch页面
 */
const customerInfor = r => require.ensure([], () => r(require('./components/customerInfor.vue')), 'customerInfor')
const routes = [
  {
    name: 'customerInfor',
    path: '/customerInfor',
    component: customerInfor,
    meta: {breadName: 'customerInfor', title: '客户信息查询'  , hidden: true }
  }
]

export default routes
