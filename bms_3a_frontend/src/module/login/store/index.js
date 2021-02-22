/**
 * author : AZW
 * time : 2020/12/8
 * desc : 登录界面vuex
 *
 */
import * as actions from './actions'
import mutations from './mutations'
export default {
  namespaced: true,
  state:{
    userName: null,
    loginSuccess: false
  },
  actions,
  mutations
}
