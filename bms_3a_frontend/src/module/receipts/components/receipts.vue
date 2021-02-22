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
                    <el-input v-model="formInline.CustomID" placeholder="客户号"></el-input>
                </el-form-item>
                <el-form-item label="客户名称">
                    <el-input v-model="formInline.CustomName" placeholder="单位名称"></el-input>
                </el-form-item>
                <el-form-item label="联系人">
                    <el-input v-model="formInline.contacts" placeholder="联系人"></el-input>
                </el-form-item>
                <el-form-item label="联系电话">
                    <el-input v-model="formInline.phone" placeholder="联系电话"></el-input>
                </el-form-item>
                <el-form-item label="地址">
                    <el-input v-model="formInline.address" placeholder="地址"></el-input>
                </el-form-item>
                <el-form-item label="订单号">
                    <el-input v-model="formInline.OrderID" placeholder="订单号"></el-input>
                </el-form-item>
                <el-form-item label="加工单号">
                    <el-input v-model="formInline.address" placeholder="加工单号"></el-input>
                </el-form-item>
                <el-form-item label="应收应付标志">
                    <el-select v-model="formInline.region" placeholder="应收应付标志">
                        <el-option label="应收" value="0"></el-option>
                        <el-option label="应付" value="1"></el-option>
                        <el-option label="全部" value="2"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="开始时间~截止时间">
                    <el-col :span="10">
                        <el-date-picker type="date" placeholder="开始时间" v-model="formInline.StartTime" style="width: 100%;"></el-date-picker>
                        </el-col>
                    <el-col class="line" :span="2">~</el-col>
                    <el-col :span="10">
                        <el-time-picker placeholder="结束时间" v-model="formInline.EndTime" style="width: 100%;"></el-time-picker>
                    </el-col>
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
      prop="OrderID"
      label="订单号"
     >
    </el-table-column>
    <el-table-column
      prop="SubOrderID"
      label="加工单号"
      >
    </el-table-column>
     <el-table-column
      prop="CustomID"
      label="客户号"
      >
    </el-table-column>
    <el-table-column
      prop="ComPayName"
      label="付款/收款单位名称"
      >
    </el-table-column>
    <el-table-column
      prop="PayFlag"
      label="应收应付标志"
      >
    </el-table-column>
    <el-table-column
      prop="OderAmount"
      label="订单金额"
      >
    </el-table-column>
    <el-table-column
      prop="PaidAmount"
      label="已付金额"
     >
    </el-table-column>
    <el-table-column
      prop="Arrears"
      label="欠费金额"
     >
    </el-table-column>
    <el-table-column
      prop="PayDate"
      label="付款状态"
     >
    </el-table-column>
    <el-table-column
      prop="OrderDate"
      label="生成日期"
     >
    </el-table-column>
    <el-table-column
      prop="BranchID"
      label="所属branch"
     >
    </el-table-column>
    <el-table-column
      prop="OperatorID"
      label="操作人"
     >
    </el-table-column>
    <el-table-column
      prop="Makedate"
      label="操作日期"
     >
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
        tableData: [],
    };
  },

  created: function() {
    
  },
  methods: {
    handleCurrentChange(val){
        console.log(val)
    },
    seachSubmit(){
        this.$message('点击了查询按钮');
    },
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
