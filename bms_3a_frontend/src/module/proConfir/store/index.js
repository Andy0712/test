// export default const state = {}

import mutations from './mutations'
import getters from './getters'
export default {
  namespaced: true,
  state:{
    viewList:[]
  } ,
  getters,
  mutations
}