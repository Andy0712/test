/**
 * author : AZW
 * time : 2020/12/8
 * desc : branch页面
 */
const orderInquiry = r => require.ensure([], () => r(require('./components/orderInquiry.vue')), 'orderInquiry')
const routes = [
  {
    name: 'orderInquiry',
    path: '/orderInquiry',
    component: orderInquiry,
    meta: {breadName: 'orderInquiry', title: '订单查询'  , hidden: true }
  }
]

export default routes
