/**
 * author : AZW
 * time : 2020/12/16
 * desc : branch页面
 */
const proConfir = r => require.ensure([], () => r(require('./components/proConfir.vue')), 'proConfir')
const routes = [{
    name: 'proConfir',
    path: '/proConfir',
    component: proConfir,
    meta: { breadName: '生产确认处理', title: '生产确认处理', hidden: true }
}]

export default routes
