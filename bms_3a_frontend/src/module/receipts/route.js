/**
 * author : AZW
 * time : 2020/12/18
 * desc : branch页面
 */
const receipts = r => require.ensure([], () => r(require('./components/receipts.vue')), 'receipts')
const routes = [
  {
    name: 'receipts',
    path: '/receipts',
    component: receipts,
    meta: {breadName: 'receipts', title: '应收应付查询'  , hidden: true }
  }
]

export default routes
