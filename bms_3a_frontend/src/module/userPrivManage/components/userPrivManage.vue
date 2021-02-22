<template>
    <div class="Role">
         <el-form :inline="true" :model="formInline" style="padding:20px 20px 0;">
            <el-form-item label="角色名称">
                <el-select v-model="formInline.name" placeholder="角色名称">
                    <el-option label="区域一" value="shanghai"></el-option>
                    <el-option label="区域二" value="beijing"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="seachSubmit">查询</el-button>
                <el-button @click="save">保存</el-button>
            </el-form-item>
        </el-form>
        <div class="main">
            <el-tree style="width:45%;height:427px;"
            :data="data"
            show-checkbox
            default-expand-all
            node-key="id"
            ref="tree"
            highlight-current
            :props="defaultProps"
            >
            </el-tree>
            <div class="zhongjian" style="width:50px">
                <span @click="getCheckedNodes">赋予</span>
                <span>收回</span>
            </div>
             <el-tree
             style="width:45%;height:427px;"
            :data="data1"
            :show-checkbox='true'
            default-expand-all
            node-key="id1"
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
            this.data1=[];
            let list = this.$refs.tree.getCheckedNodes();
            const _this = this;
            // debugger
            for(let i in list){
                if(list[i].id === 1){
                    _this.data1.push(list[i])
                }
            }
        },
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