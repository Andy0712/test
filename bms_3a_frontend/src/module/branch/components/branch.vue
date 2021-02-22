<template>
  <div class="login-wrapper">
    <div class="basicIndex-wrapper">
        <div class="head">
            <div class="title">
                <i class="el-icon-caret-right"></i>
                <span>查询条件</span>
            </div>
            <el-form  :inline='true'   :model="formInline" size="mini"  class="form">
                <el-form-item label="机构编码">
                    <el-input v-model="formInline.branchid" placeholder="机构编码"></el-input>
                </el-form-item>
                <el-form-item label="机构名称">
                    <el-input v-model="formInline.name" placeholder="机构名称"></el-input>
                </el-form-item>
                <el-button size="mini"  style="background:#666;color:#fff;" class="info" @click="addSubmit">新增</el-button>
                <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
            </el-form>
            <!-- <div class="form-oper">
                <el-row>
                <el-col :span="7" :offset="17">
                    <el-button size="mini" class="reset" @click="addSubmit">新增</el-button>
                    <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
                </el-col>
                </el-row>
            </div> -->
        </div>
         
    <div class="basicIndex-table">
        <el-table
          v-loading="tableLoading"
          ref="basicIndexTable"
          :data="tableData"
          style="width: 100%"
          max-height="350"
        >
          <el-table-column
          prop="branchid"
          label="机构编码"
          width="120">
        </el-table-column>
        <el-table-column
          prop="name"
          label="机构名称"
          >
        </el-table-column>
        <el-table-column
          prop="address"
          label="机构地址"
         >
        </el-table-column>
        <el-table-column
          prop="city"
          label="城市"
          >
        </el-table-column>
        <el-table-column
          prop="zipcode"
          label="机构邮编"
          >
        </el-table-column>
        <el-table-column
          prop="phone"
          label="机构电话"
          >
        </el-table-column>
        <el-table-column
          prop="fax"
          label="机构传真"
          >
        </el-table-column>
        <el-table-column
          prop="email"
          label="EMail"
          >
        </el-table-column>
        <el-table-column
          prop="webaddress"
          label="网址"
          >
        </el-table-column>
        <el-table-column
          prop="satrapname"
          label="机构负责人"
          width="120">
        </el-table-column>
        <el-table-column
          prop="bank1"
          label="开户行1"
          >
        </el-table-column>
        <el-table-column
          prop="bankaccno"
          label="银行账号1"
          width="120">
        </el-table-column>
        <el-table-column
          prop="bankaccname1"
          label="银行户名1"
          width="120">
        </el-table-column>
        <el-table-column
          prop="bank2"
          label="开户2"
         >
        </el-table-column>
        <el-table-column
          prop="bankaccno2"
          label="银行账号2"
          width="120">
        </el-table-column>
        <el-table-column
          prop="bankaccname2"
          label="银行户名2"
         width="120">
        </el-table-column>
        <el-table-column
          prop="bank3"
          label="开户3"
          >
        </el-table-column>
        <el-table-column
          prop="bankaccno3"
          label="银行账号3"
        width="120" >
        </el-table-column>
        <el-table-column
          prop="bankaccname3"
          label="银行户名3"
          width="120">
        </el-table-column>
        <el-table-column
          prop="gstno"
          label="GST"
         >
        </el-table-column>
        <el-table-column
          prop="comgrade"
          label="机构级别"
          >
        </el-table-column>
        <el-table-column
          prop="comareatype"
          label="机构地区类型"
          width="120">
        </el-table-column>
        <el-table-column
          prop="upcomcode"
          label="上级管理机构"
          width="120">
        </el-table-column>
        <el-table-column
          prop="comstate"
          label="机构状态"
          >
        </el-table-column>
        <el-table-column
          prop="setupdate"
          label="开业日期"
          width="150">
        </el-table-column>
        <el-table-column
          prop="backoutdate"
          label="撤销日期"
          width="150">
        </el-table-column>
          <el-table-column
            label="操作"
            align="center"
          width="130">
           <template slot-scope="scope">
                <el-button @click="viewDetail(scope.row)" type="text" size="small" style='width:30px;'>查看</el-button>
                <el-button type="text" size="small" @click="edit(scope.row)" style='width:30px;'>编辑</el-button>
                <el-button type="text" size="small" @click="deleted(scope.row)" style='width:30px;'>删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <!-- <el-pagination class="currentPage"
            @current-change="handleCurrentChange"
            :current-page="currentpages"
            :page-size="pagesize"       
            layout="total, prev, pager, next"
            :total="total"> 
        </el-pagination> -->
      </div>
    <el-dialog
          title="新增/编辑 "
          :visible.sync="dialogFormVisible"
          :close-on-click-modal='false'
          :close-on-press-escape='false'
          class="dialog"
          width="70%"
          :before-close='handleAddClose'>
        <el-form :label-position="labelPosition" size="mini" :rules="rules" ref="formLabelAlign" label-width="80px" :model="formLabelAlign" class="demo-form-inline">
            <el-form-item label="机构编码" prop="branchid" label-width="100px">
                <el-input v-model="formLabelAlign.branchid" type="number"></el-input>
            </el-form-item>
            <el-form-item label="机构名称" prop="name" label-width="100px">
                <el-input v-model="formLabelAlign.name"></el-input>
            </el-form-item>
            <el-form-item label="机构地址" prop="address" label-width="100px">
                <el-input v-model="formLabelAlign.address"></el-input>
            </el-form-item>
            <el-form-item label="城市" prop="city" label-width="100px">
                <el-input v-model="formLabelAlign.city"></el-input>
            </el-form-item>
            <el-form-item label="机构邮编" prop="zipcode " label-width="100px">
                <el-input v-model="formLabelAlign.zipcode"></el-input>
            </el-form-item>
            <el-form-item label="机构电话" prop="phone" label-width="100px">
                <el-input v-model="formLabelAlign.phone"></el-input>
            </el-form-item>
            <el-form-item label="机构传真" prop="fax" label-width="100px">
                <el-input v-model="formLabelAlign.fax"></el-input>
            </el-form-item>
            <el-form-item label="EMail" prop="email" label-width="100px">
                <el-input  v-model="formLabelAlign.email"></el-input>
            </el-form-item>
            <el-form-item label="网址" prop="webaddress" label-width="100px">
                <el-input v-model="formLabelAlign.webaddress"></el-input>
            </el-form-item>
            <el-form-item label="机构负责人" prop="satrapname" label-width="100px">
                <el-input v-model="formLabelAlign.satrapname"></el-input>
            </el-form-item>
            <el-form-item label="GST" prop="gstno" label-width="100px">
                <el-input v-model="formLabelAlign.gstno"></el-input>
            </el-form-item>
            <el-form-item label="机构级别" prop="comgrade" label-width="100px">
                <el-select v-model="formLabelAlign.comgrade" placeholder="机构级别">
                  <el-option label="总公司" value="1"></el-option>
                  <el-option label="分支机构" value="2"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="机构地区类型" prop="comareatype" label-width="120px">
                <el-input v-model="formLabelAlign.comareatype"></el-input>
            </el-form-item>
            <el-form-item label="上级管理机构" prop="upcomcode" label-width="120px">
                <el-input v-model="formLabelAlign.upcomcode"></el-input>
            </el-form-item>
            <el-form-item label="机构状态" prop="comstate" label-width="100px"> 
                <el-select v-model="formLabelAlign.comstate" placeholder="机构状态">
                  <el-option label="有效" value="1"></el-option>
                  <el-option label="无效" value="2"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="开户行1" prop="bankacc1" label-width="100px">
                <el-input v-model="formLabelAlign.bankacc1"></el-input>
            </el-form-item>
            <el-form-item label="开户行2" prop="bankacc2" label-width="100px">
                <el-input v-model="formLabelAlign.bankacc2"></el-input>
            </el-form-item>
            <el-form-item label="开户行3" prop="bankacc3" label-width="100px">
                <el-input v-model="formLabelAlign.bankacc3"></el-input>
            </el-form-item>
            <el-form-item label="银行户名1" prop="bankaccname1" label-width="100px">
                <el-input v-model="formLabelAlign.bankaccname1"></el-input>
            </el-form-item>
             <el-form-item label="银行户名2" prop="bankaccname2" label-width="100px">
                <el-input v-model="formLabelAlign.bankaccname2"></el-input>
            </el-form-item>
             <el-form-item label="银行户名3" prop="bankaccname3" label-width="100px">
                <el-input v-model="formLabelAlign.bankaccname3"></el-input>
            </el-form-item>
            <el-form-item label="银行账号1" prop="bankaccno1" label-width="100px">
                <el-input   v-model="formLabelAlign.bankaccno1"></el-input>
            </el-form-item>
            <el-form-item label="银行账号2" prop="bankaccno2" label-width="100px">
                <el-input v-model="formLabelAlign.bankaccno2"></el-input>
            </el-form-item>
            <el-form-item label="银行账号3" prop="bankaccno3" label-width="100px">
                <el-input v-model="formLabelAlign.bankaccno3"></el-input>
            </el-form-item>
            <el-form-item prop="setupdate" label="开始时间" label-width="100px">
                <el-date-picker format='yyyy-MM-dd' value-format="yyyy-MM-dd"  type="datetime" placeholder="选择日期" v-model="formLabelAlign.setupdate" style="width: 100%;"></el-date-picker>
            </el-form-item>
            <el-form-item prop="backoutdate" label="结束时间" label-width="100px">
                <el-date-picker format='yyyy-MM-dd' value-format="yyyy-MM-dd" type="datetime"  placeholder="选择日期" v-model="formLabelAlign.backoutdate" style="width: 100%;"></el-date-picker>
            </el-form-item>
             <el-form-item></el-form-item>
        </el-form>
          <div slot="footer" class="dialog-footer" v-if="!isView">
            <el-button size="mini" @click="handleAddClose">取 消</el-button>
            <el-button size="mini" @click.stop="submitForm"  class="changeColor">保 存</el-button>
          </div>
        </el-dialog>
    </div>
  </div>
</template>
<script>
import invokers from "../../../invokers";
import storage from "../../../common/js/storage";
import { mapMutations, mapActions } from "vuex";
import axios from "axios";
export default {
  name: "login",
  data() {
    return {
        dialogFormVisible:false,
        tableLoading: true,//表格loading
        // currentpages:1,
        // pagesize:10,
        // total:0,
        isView:false,
        formInline:{
            branchid: '',
            name:""
        },
        labelPosition: 'right',
        formLabelAlign: {
          "address": "",
          "backoutdate": "",
          "bankacc1": "",
          "bankacc2": "",
          "bankacc3": "",
          "bankaccname1": "",
          "bankaccname2": "",
          "bankaccname3": "",
          "bankaccno1": "",
          "bankaccno2": "",
          "bankaccno3": "",
          "branchid": "",
          "city": "",
          "comareatype": "",
          "comgrade": "",
          "comstate": "",
          "crtdate": "",
          "crtuser": "",
          "dataflag": "",
          "email": "",
          "fax": "",
          "gstno": "",
          "mdfdate": "",
          "mdfuser": "",
          "memo": "",
          "name": "",
          "phone": "",
          "satrapname": "",
          "serno": "",
          "setupdate": "",
          "upcomcode": "",
          "webaddress": "",
          "zipcode": ""
        },
        tableData: [],
        rules: {
          branchid: [
            { required: true, message: '请输入机构编码', trigger: 'change' },
            { pattern: /^(\d{10})$/,message:"机构编码为10位"}
          ],
          name: [
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          address:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          city:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          zipcode:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          phone:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          fax:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          email:[
              { required: true,message: '不能为空', trigger: 'change' },
              {pattern:/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,message:"请输入格式正确的邮箱"}
          ],
          webaddress:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          satrapname:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankaccno1:[
              { required: true, message: '不能为空', trigger: 'change' },
              { pattern: /^(\d{16,19})$/,message:"请输入正确的银行账号"}
          ],
          bankaccno3:[
              { required: true, message: '不能为空', trigger: 'change' },
              { pattern: /^(\d{16,19})$/,message:"请输入正确的银行账号"}
          ],
          bankaccno2:[
              { required: true, message: '不能为空', trigger: 'change' },
              { pattern: /^(\d{16,19})$/,message:"请输入正确的银行账号"}
          ],
          gstno:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          comgrade:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          comareatype:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          upcomcode:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          comstate:[
              { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankaccname1:[
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankaccname2:[
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankaccname3:[
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          setupdate: [
            { required: true, message: '请选择开始日期', trigger: 'change' }
          ],
          backoutdate: [
            { required: true, message: '请选择结束日期', trigger: 'change' }
          ],
          bankacc1:[
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankacc2:[
            { required: true, message: '不能为空', trigger: 'change' }
          ],
          bankacc3:[
            { required: true, message: '不能为空', trigger: 'change' }
          ]
        }
    };
  },
  created: function() {
    this.loadTableInfo();
  },
  methods: {
    ...mapActions("branch",{
      seachList:"searchList",
      submit_Form:"submit_Form",
      editStatus:"editStatus",
      update:"upDate"
    }),
    async loadTableInfo(){
      let data = await this.seachList(this.formInline);
      if(data.successful){
        this.tableData = data.result;
        this.tableLoading = false;
      }else{
        let msg = "";
        for(let i in data.messages){
          msg = " "+data.messages[i]
        }
        if(msg == "没有操作权限"){
          this.loginTimeout()
        }else{
          this.$message(msg)
        }
        
      }
    },
    handleCurrentChange(val){
        console.log(val)
    },
    addSubmit(){
        this.dialogFormVisible = true;
        this.formLabelAlign = {};
    },
    edit(item){
        console.log(item)
        this.dialogFormVisible = true;
        this.formLabelAlign = item;
        this.isView = false;
    },
    viewDetail(item){
      this.dialogFormVisible = true;
      this.formLabelAlign = item;
      this.isView = true;
    },
    async seachSubmit(){
      let data = await this.seachList(this.formInline);
      this.formInline = {
          branchid: '',
          name:""
      };
      if(data.successful){
        this.tableData = data.result;
        this.tableLoading = false;
      }else{
        let msg = "";
        for(let i in data.messages){
          msg = " "+data.messages[i]
        }
        this.$message(msg)
      }
    },
    submitForm() {
      let _this = this;
        this.$refs.formLabelAlign.validate(async (valid) => {
          if (valid) {
            if(this.formLabelAlign.crtuser){
              _this.formLabelAlign.mdfuser = JSON.parse(sessionStorage.getItem("userInfo")).userName;
              let data = await this.update(this.formLabelAlign);
              if(data.successful){
                this.$message({message:"修改成功!",type:"success"});
              }else{
                let msg = "";
                for(let i=0;i<data.messages.length;i++){
                  msg +=data.messages[i]+" "
                }
                this.$message(msg)
              }
            }else{
              _this.formLabelAlign.crtuser = JSON.parse(sessionStorage.getItem("userInfo")).userName;
              let data = await this.submit_Form(this.formLabelAlign);
              if(data.successful){
                this.loadTableInfo();
              }else{
                let msg = "";
                for(let i=0;i<data.messages.length;i++){
                  msg +=data.messages[i]+" "
                }
                this.$message(msg)
              }
            }
            this.dialogFormVisible = false;
            this.$refs.formLabelAlign.resetFields();
          } 
        });
    },
    handleAddClose(){
      this.dialogFormVisible = false;
      this.$refs.formLabelAlign.resetFields();
    },
    deleted(item){
      this.$confirm('确定改变该分支的状态?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let rep = await this.editStatus(item.branchid);
        if(rep.successful){
          this.$message({message:"状态修改成功!",type:"success"});
          this.loadTableInfo();
        }
      }).catch(() => {
        return false;
      });
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
          justify-content: space-around;
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
      .basicIndex-table{
        .el-button{
          margin-left: 0;
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
