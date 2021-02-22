<template>
    <div class="Role">
         <el-form :inline="true" :model="formInline" style="padding:20px 20px 0;">
            <el-form-item label="角色名称">
                <el-select v-model="formInline.name" placeholder="角色名称">
                    <el-option label="销售人员" value="1001"></el-option>
                    <el-option label="采购人员" value="1002"></el-option>
                    <el-option label="库存管理人员" value="1003"></el-option>
                    <el-option label="生产人员" value="1004"></el-option>
                    <el-option label="生产主管" value="1005"></el-option>
                    <el-option label="财务人员" value="1006"></el-option>
                    <el-option label="报价审批" value="1007"></el-option>
                    <el-option label="设计人员" value="1008"></el-option>
                    <el-option label="店经理" value="1009"></el-option>
                    <el-option label="HR" value="1010"></el-option>
                    <el-option label="公司经理" value="1011"></el-option>
                    <el-option label="网上在线支持" value="1012"></el-option>
                    <el-option label="App在线支持" value="1013"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="seachSubmit">查询</el-button>
                <el-button @click="save">保存</el-button>
            </el-form-item>
        </el-form>
        <div class="main">
            <el-tree style="width:45%;height:100%"
            :data="data"
            show-checkbox
            default-expand-all
            node-key="id"
            ref="tree"
            highlight-current
            :props="defaultProps">
            </el-tree>
            <div class="zhongjian" style="width:50px">
                <span @click="getCheckedNodes">赋予</span>
                <span>收回</span>
            </div>
             <el-tree
             style="width:45%;height:100%"
            :data="data1"
            :show-checkbox='true'
            default-expand-all
            node-key="id"
            ref="tree1"
            highlight-current
            :props="defaultProps1">
            </el-tree>
        </div>
    </div>
</template>
<script>
import Vue from 'vue'
export default {
    data(){
        return{
            formInline:{
                name:""
            },
            data: [{
                id: 1,
                label: '一级 1',
                children: [{
                    id: 4,
                    label: '二级 1-1',
                    children: [{
                    id: 9,
                    label: '三级 1-1-1'
                    }, {
                    id: 10,
                    label: '三级 1-1-2'
                    }]
                }]
                }, {
                id: 1,
                label: '一级 2',
                children: [{
                    id: 5,
                    label: '二级 2-1'
                }, {
                    id: 6,
                    label: '二级 2-2'
                }]
                }, {
                id: 1,
                label: '一级 3',
                children: [{
                    id: 7,
                    label: '二级 3-1'
                }, {
                    id: 8,
                    label: '二级 3-2'
                }]
            }],
            data1:[],
            defaultProps: {
                children: 'children',
                label: 'label'
            },
            defaultProps1: {
                children: 'children',
                label: 'label'
            }
        }
        
    },
    methods:{
        seachSubmit(){

        },
        save(){

        },
        getCheckedNodes() { 
            const list = this.$refs.tree.getCheckedNodes();
            for(let i = 0,l=list.length;i>=0;i--){
                if(list[i].children && list[i].children.length>0){
                    list.splice(i,1)
                }
            }
            this.data1 = [];
            if(list.length>0){
                this.filterNode(list,this.data);
            }else{
                this.$message({
                    message:"请勾选需要赋予的权限",
                    type:"warning"
                })
            }
            let obj = {};
            this.data1 = this.data1.reduce(function(item, next) {
                obj[next.label] ? '' : obj[next.label] = true && item.push(next);
                return item;
            }, []);
            if(this.data1){
                this.filterChildnNode(list,this.data1)
                // this.data1.splice(1,1)
            }
            
        },

        filterNode(list,data,node,parentNode){
            for(let i in list){
                for(let o in data){
                    if(list[i].label === data[o].label){
                        if(parentNode){
                            this.data1.push(parentNode)
                        }else{
                            this.data1.push(data[o])
                        }
                    }else{
                        if(data[o].children && data[o].children.length>0){
                            if(parentNode){
                                this.filterNode(list,data[o].children,data[o],parentNode)
                            }else{
                                this.filterNode(list,data[o].children,data[o],data[o])
                            }
                        }
                    }
                }

            }
        },

        filterChildnNode(list,data1,Childnode){
            if(list.length>0){
                for(let i in list){
                    for(let o in data1){
                        if(data1[o].label != list[i].label){
                            if(data1[o].children && data1[o].children.length>0){
                                this.filterChildnNode(list[i],data1[o].children,data1[o])
                            }else{
                                if(Childnode){
                                    Childnode.children.splice(o,1)
                                    // return false;
                                }else{
                                    data1.splice(o,1)
                                    // return false
                                }
                            }
                        }
                        return;
                    }
                }
            }else{
                for(let i in data1){
                    if(data1[i].label != list.label){
                        if(data1[i].children && data1[i].children.length>0){
                            this.filterChildnNode(list,data1[i].children,data1[i])
                        }else{
                            if(Childnode){
                                Childnode.children.splice(i,1)
                            }else{
                                data1.splice(i,1)
                            }
                        }
                    }   
                    return
                }
            }
            
        }

    }
}
</script>
<style scoped lang="less">
    .Role{
        .main{
            display: flex;
            justify-content: space-between;
            .zhongjian{
                text-align: center;
                span{
                    background: #fff;
                    display: block;
                    padding:10px 0;
                    margin: 60px 0;
                }
                span:hover{
                    cursor: pointer;
                }
            }
        }
    }
</style>