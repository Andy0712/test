<template>
  <div class="login-wrapper">
    <div class="basicIndex-wrapper">
        <div class="head">
            <div class="title">
                <i class="el-icon-caret-right"></i>
                <span>查询条件</span>
            </div>
            <el-form  :inline='true'   :model="formInline" size="mini"  class="form">
                <el-form-item label="客户号">
                    <el-input v-model="formInline.Number" placeholder="客户号"></el-input>
                </el-form-item>
                <el-form-item label="客户名称">
                    <el-input v-model="formInline.Name" placeholder="客户名称"></el-input>
                </el-form-item>
                <el-form-item label="联系人">
                    <el-input v-model="formInline.contacts" placeholder="联系人"></el-input>
                </el-form-item>
                <el-form-item label="Email">
                    <el-input v-model="formInline.Email" placeholder="Email"></el-input>
                </el-form-item>
                <el-form-item label="联系电话">
                    <el-input  v-model="formInline.phone" placeholder="联系电话"></el-input>
                </el-form-item>
                <el-form-item label="地址">
                    <el-input v-model="formInline.address" placeholder="地址"></el-input>
                </el-form-item>
            </el-form>
            <div class="form-oper">
                <el-row>
                <el-col :span="7" :offset="17">
                    <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
                </el-col>
                </el-row>
            </div>
        </div>
         
    <div class="basicIndex-table">
        <el-table
          v-loading="tableLoading"
          ref="basicIndexTable"
          :data="tableData"
          style="width: 100%"
        >
          <el-table-column
      prop="Number"
      label="客户号"
     >
    </el-table-column>
    <el-table-column
      prop="Name"
      label="客户名称"
      >
    </el-table-column>
    <el-table-column
      prop="Tag"
      label="单位/个人客户标识"
      >
    </el-table-column>
    <el-table-column
      prop="Contacts"
      label="联系人1"
      >
    </el-table-column>
    <el-table-column
      prop="Phone"
      label="联系电话1"
     >
    </el-table-column>
        <el-table-column
        label="操作"
        align="center"
        >
        <template slot-scope="scope">
            <el-button type="text" size="small" @click="viewDetail(scope.row)">查看</el-button>
        </template>
        </el-table-column>
        </el-table>
        <el-pagination class="currentPage"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-size="pagesize"       
            layout="total, prev, pager, next"
            :total="tableData.length"> 
        </el-pagination>
      </div>
      <div>
           <el-dialog
          title="客户信息 "
          :visible.sync="dialogFormVisible"
          :close-on-click-modal='false'
          :close-on-press-escape='false'
          class="dialog"
          :before-close='handleAddClose'>
            <el-form :label-position="labelPosition" ref="formLabelAlign" label-width="80px"  class="demo-form-inline">
                <el-form-item label="客户号:">
                   <span>{{formLabelAlign.Number}}</span>
                </el-form-item>
                <el-form-item label="客户名称:">
                     <span>{{formLabelAlign.Name}}</span>
                </el-form-item>
                <el-form-item label="客户标识:" >
                     <span>{{formLabelAlign.Tag}}</span>
                </el-form-item>
                <el-form-item label="联系人:" >
                     <span>{{formLabelAlign.Contacts}}</span>
                </el-form-item>
                <el-form-item label="联系电话:" >
                     <span>{{formLabelAlign.Phone}}</span>
                </el-form-item>
            </el-form>
        </el-dialog>
      </div>
    </div>
  </div>
</template>
<script>
import invokers from "../../../invokers";
import storage from "../../../common/js/storage";
import { mapMutations, mapActions } from "vuex";
import axios from "axios";
export default {
  name: "customerInfor",
  data() {
    return {
        dialogFormVisible:false,
        currentpages:1,
        pagesize:10,
        total:0,
        formInline:{
            Number: '',
            Name:"",
            contacts:"",
            Email:"",
            phone:"",
            address:""
        },
        labelPosition: 'right',
        formLabelAlign: {},
        tableData: [
            {
                Number: '23124124',
                Name: '测试',
                Tag: '个人',
                Contacts:'王五',
                Phone:"13082329987",
            },
            {
                Number: '23124124',
                Name: '测试',
                Tag: '单位',
                Contacts:'李四',
                Phone:"13082329987",
            },
            {
                Number: '23124124',
                Name: '测试',
                Tag: '个人',
                Contacts:'张三',
                Phone:"13082329987",
            },
        ],
    };
  },

  created: function() {
    
  },
  methods: {
    handleCurrentChange(val){
        console.log(val)
    },
    addSubmit(){
        this.dialogFormVisible = true;
        // this.$message('点击新增按钮');
        this.formLabelAlign = {};
    },
    seachSubmit(){
        this.$message('点击了查询按钮');
    },
    handleClick(row) {
        console.log(row);
    },
     handleAddClose(){
        this.dialogFormVisible = false;
    },
    viewDetail(val){
        this.dialogFormVisible = true;
        this.formLabelAlign = val;
    }
  }
};
</script>
<style rel="stylesheet/less" lang="less" scoped>
.clearfix {
    zoom: 1;
    &:after {
      content: '';
      display: table;
      overflow: hidden;
      clear: both;
    }
  }

  .el-select {
    width: 100%;
  }

  .el-button {
    width: 90px;
  }

  .el-scrollbar {
    width: 100%;
  }

  .el-date-editor {
    width: 100%;
  }

  .changeColor {
    background: red;
    color: #fff;
  }

  .login-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    padding: 20px;
    background: #eeeeee;
    .basicIndex-wrapper {
      position: relative;
      width: 100%;
      height: auto;
      .head{
          margin-bottom: 20px;
      }
      .demo-form-inline{
          display: flex;
          flex-wrap: wrap;
          .el-form-item{
              width:50%
          }
      }
      .title {
        width: 100%;
        box-sizing: border-box;
        height: 44px;
        line-height: 44px;
        padding: 0 18px;
        font-size: 12px;
        background: #fff;
        border-bottom: 1px solid #eeeeee;
    }
      .form {
        width: 100%;
        background: #fff;
        box-sizing: border-box;
        padding: 22px;
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
        .el-row {
          padding-bottom: 13px;
          .el-col {
            height: 40px;
            line-height: 40px;
          }
        }

      }
      .form-oper {
        background: #fff;
        box-sizing: border-box;
        padding: 18px;
        .el-button {
          width: 120px;
          background: red;
          color: #fff;
        }
        .el-button:first-child {
          background: #b3b3b3;
        }
      }
      .table-oper {
        padding: 18px;
        padding-left: 22px;
        .el-button {
          width: 90px;
          border: 0;
          border-radius: 4px;
        }
        .el-button:first-child {
          background: red;
          color: #fff;
        }
      }
      .currentPage{
          width: 100%;
          padding: 10px 20px ;
          box-sizing: border-box;
          border-top: 1px solid eee;
          background: #fff;
          
      }
    }

    .el-dialog {
      .el-form {
        padding-bottom: 12px;
        border-bottom: 1px solid #eee;
      }

      .table-oper-btn {
        text-align: right;
        padding: 16px 0px;

        .el-button {
          width: 90px;
          background: #fff;
        }

        .el-button:last-child {
          background: red;
          color: #fff;
        }
      }
    }
  }

</style>
