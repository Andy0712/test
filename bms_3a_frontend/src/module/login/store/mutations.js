



import { LOGIN_IN, LOGIN_OUT, UPDATE_REMAINING  , FETCH_AUTH} from './constants'
import storage from '../../../common/js/storage'
export default {
  [LOGIN_IN](state,{userName , userId , loginSuccess}) {
    state.userName = userName //  用户名
    state.userId = userId             // 用户id
    state.loginSuccess = loginSuccess   // 登录状态
  },
  [LOGIN_OUT](state,payload) {
    state.userName = null
    state.userId = null
    state.loginSuccess = false
    storage.locals.remove('theme')
    storage.locals.remove('menuList')
  },
  // 获取用户信息x
  [FETCH_AUTH](state ,{userName , userId , loginSuccess}){
    state.userName = userName
    state.userId = userId
    state.loginSuccess = loginSuccess
  }
}
