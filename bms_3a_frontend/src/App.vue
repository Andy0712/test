<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>
<script>

export default {
  name: 'App',
  mounted(){
    let theme = document.cookie;
    if(theme){
      document.getElementById('app').className = theme;
    }
  }
}

</script>

<style>
#app {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
