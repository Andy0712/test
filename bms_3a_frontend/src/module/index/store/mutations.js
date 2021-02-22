import {ADD_VIEWS_LIST ,DEL_ALL_VIEWS_LIST , DEL_OTHER_VIEWS }  from './constants'
export default {
  ADD_VIEWS_LIST(state , view){
    if(state.viewList.some(v => v.path === view.path)) return
      state.viewList.push({
        name : view.name,
        path: view.path,
        title: view.meta.title,
        hidden: view.meta.hidden,
      })
  },
  DEL_ALL_VIEWS_LIST(state){
    state.viewList = []
  },
  DEL_VIEWS_LIST(state , view){
    state.viewList.forEach((e , index)=>{
      if(e.path === view.path){
        state.viewList.splice(index, 1)
      }
    })
  },
  DEL_OTHER_VIEWS(state , view){
    for (const [i, v] of state.viewList.entries()) {
      if (v.path === view.path) {
        state.viewList = state.viewList.slice(i, i + 1)
        break
      }
    }
  }
}
