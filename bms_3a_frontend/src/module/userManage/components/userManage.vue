<template>
  <div class="login-wrapper">
    <div class="basicIndex-wrapper">
      <div class="head">
            <div class="title">
                <i class="el-icon-caret-right"></i>
                <span>查询条件</span>
            </div>
            <el-form  :inline='true'   :model="formInline" size="mini"  class="form">
                <el-form-item label="角色名称">
                    <el-input v-model="formInline.name" placeholder="角色名称"></el-input>
                </el-form-item>
                <el-form-item label="角色代码">
                    <el-input v-model="formInline.number" placeholder="角色代码"></el-input>
                </el-form-item>
                <el-button size="mini" style="background:#666;color:#fff;" class="reset" @click="addSubmit">新增</el-button>
                <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
            </el-form>
        </div>
        <div class="basicIndex-table">
          <el-table
          v-loading="tableLoading"
          ref="basicIndexTable"
          :data="tableData"
          max-height="380"
          style="width: 100%">
        <el-table-column
          prop="CustomerNo"
          label="用户代码"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="CustomerName"
          label="用户名称"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="Name"
          label="姓名"
          width="100"
          >
        </el-table-column>
         <el-table-column
          prop="Password"
          label="密码"
          width="150"
          >
        </el-table-column>
        <el-table-column
          prop="Branch"
          label="所属Branch"
          width="120">
        </el-table-column>
        <el-table-column
          prop="Birthday"
          label="出生日期"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="Nationality"
          label="国籍"
          width="100"
          >
        </el-table-column>
         <el-table-column
          prop="Phone"
          label="联系电话"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="Mobile"
          label="Mobile"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="Email"
          label="电子邮箱"
          width="140"
          >
        </el-table-column>
         <el-table-column
          prop="BoardDate"
          label="入司日期"
          width="100"
          >
        </el-table-column>
         <el-table-column
          prop="Status"
          label="状态"
          width="100"
          >
        </el-table-column>
         <el-table-column
          prop="Nature"
          label="性质"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="WeekDate"
          label="一周工作时长"
          width="120">
        </el-table-column>
        <el-table-column
          prop="StartDate"
          label="开始时间"
          width="120"
          >
        </el-table-column>
         <el-table-column
          prop="EndDate"
          label="结束时间"
          width="120"
          >
        </el-table-column>
        <el-table-column
          prop="Education"
          label="学历"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="IRDNum"
          label="IRD号码"
          width="100"
          >
        </el-table-column>
        <el-table-column
          prop="BackNum"
          label="银行账户"
          width="120"
          >
        </el-table-column>
        <el-table-column
          prop="DepartureDate"
          label="离职日期"
          width="120"
          >
        </el-table-column>
        <el-table-column
          label="操作"
          width="120">
          <template slot-scope="scope">
            <el-button type="text" size="small" @click="edit(scope.row)">编辑</el-button>
            <el-button type="text" size="small" @click="deleted(scope.row)">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="block">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[10, 20, 30, 40,50]"
          :page-size="pagesize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
      <el-dialog
              title="新增/编辑 "
              :visible.sync="dialogFormVisible"
              :close-on-click-modal='false'
              :close-on-press-escape='false'
              class="dialog"
              width="600px"
              :before-close='handleAddClose'>
            <el-form ref="formLabelAlign" label-width="80px" :rules="rules" :model="formLabelAlign" class="demo-form-inline">
                <el-form-item label="用户代码" prop="customerno">
                    <el-input v-model="formLabelAlign.customerno"></el-input>
                </el-form-item>
                <el-form-item label="用户名称" prop="customername">
                    <el-input v-model="formLabelAlign.customername"></el-input>
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                    <el-input v-model="formLabelAlign.name"></el-input>
                </el-form-item>
                 <el-form-item label="密码" prop="password">
                    <el-input v-model="formLabelAlign.password"></el-input>
                </el-form-item>
                 <el-form-item label="所属分支" prop="branch">
                    <el-input v-model="formLabelAlign.branch"></el-input>
                </el-form-item>
                 <el-form-item label="出生日期" prop="birthday">
                    <el-input v-model="formLabelAlign.birthday"></el-input>
                </el-form-item>
                 <el-form-item label="国籍" prop="nationality">
                    <el-input v-model="formLabelAlign.nationality"></el-input>
                </el-form-item>
                 <el-form-item label="电话" prop="phone">
                    <el-input v-model="formLabelAlign.phone"></el-input>
                </el-form-item>
                <el-form-item label="Mobile" prop="mobile">
                    <el-input v-model="formLabelAlign.mobile"></el-input>
                </el-form-item>
                <el-form-item label="电子邮箱" prop="email">
                    <el-input v-model="formLabelAlign.email"></el-input>
                </el-form-item>
                <el-form-item label="入司日期" prop="boarddate">
                    <el-input v-model="formLabelAlign.boarddate"></el-input>
                </el-form-item>
                <el-form-item label="状态" prop="status">
                    <el-select v-model="formLabelAlign.status" placeholder="请选择状态">
                    <el-option label="在职" value="在职"></el-option>
                    <el-option label="离职" value="离职"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="性质" prop="nature">
                    <el-select v-model="formLabelAlign.nature" placeholder="请选择性质">
                    <el-option label="全职" value="全职"></el-option>
                    <el-option label="兼职" value="兼职"></el-option>
                    </el-select>
                </el-form-item>
               
            </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button size="mini" @click.stop="handleAddClose" style="width:90px">取 消</el-button>
                <el-button size="mini" @click.stop="Save"  style="width:90px" class="changeColor">保 存</el-button>
              </div>
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
  name: "management",
  data() {
    return {
        dialogFormVisible:false,
        tableLoading: false,//表格loading
        currentpages:1,
        pagesize:10,
        total:0,
        formInline:{
            name: '',
            number: '',
        },
        formLabelAlign:{
            name:"",
            number:"",
            dec:""
        },
        tableData:[{CustomerNo:"2441241"}],
        rules:{
          customerno:[{ required: true, message: '不能为空', trigger: 'change' },],
          customername:[{ required: true, message: '不能为空', trigger: 'change' },],
          name:[{ required: true, message: '不能为空', trigger: 'change' },],
          password:[{ required: true, message: '不能为空', trigger: 'change' },],
          branch:[{ required: true, message: '不能为空', trigger: 'change' },],
          birthday:[{ required: true, message: '不能为空', trigger: 'change' },],
          nationality:[{ required: true, message: '不能为空', trigger: 'change' },],
          phone:[{ required: true, message: '不能为空', trigger: 'change' },],
          mobile:[{ required: true, message: '不能为空', trigger: 'change' },],
          email:[{ required: true, message: '不能为空', trigger: 'change' },],
          boarddate:[{ required: true, message: '不能为空', trigger: 'change' },],
          status:[{ required: true, message: '不能为空', trigger: 'change' },],
          nature:[{ required: true, message: '不能为空', trigger: 'change' },],
        }
    };
  },

  created: function() {
    
  },
  methods: {
    seachSubmit(){

    },
    addSubmit(){
        this.dialogFormVisible = true;
    },
    upData(){ //上传

    },
    downLoad(){//导出

    },
    deleted(item){

    },
    handleClick(item){

    },
    edit(item){

    },
    handleAddClose(){
        this.dialogFormVisible = false;
    },
    handleCurrentChange(val){
        console.log(val)
    },
    Save(){

    }
  }
};
</script>
<style rel="stylesheet/less" lang="less" scoped>
.clearfix {
  zoom: 1;
  &:after {
    content: "";
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
      
      .block{
          width: 100%;
          padding: 10px 20px ;
          box-sizing: border-box;
          border-top: 1px solid eee;
          background: #fff;
          .el-pagination{
            float:right;
          }
          overflow: hidden;
      }
      .basicIndex-table{
        margin-top: 22px;
        .el-button{
          width:30px;
          margin-left: 0;
        }
      }
      .demo-form-inline{
          display: flex;
          flex-wrap: wrap;
          // justify-content: space-around;
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
