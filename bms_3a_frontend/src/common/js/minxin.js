
const mixins = {
  methods:{
    handleIndexSelect(index){
      return (this.nowPage - 1)*this.rowPage + index + 1 
    }
  }
}
export default mixins