<template>
  <div class="login-wrapper">
    <div class="basicIndex-wrapper">
        <div class="head">
            <div class="title">
                <i class="el-icon-caret-right"></i>
                <span>查询条件</span>
            </div>
            <el-form  :inline='true'   :model="formInline" size="mini"  class="form">
                <el-form-item label="客户名称">
                    <el-input v-model="formInline.Name" placeholder="客户名称"></el-input>
                </el-form-item>
                <el-form-item label="客户号">
                    <el-input v-model="formInline.Number" placeholder="客户号"></el-input>
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
         <div class="dingDanlist">
            <ul>
                <li v-for="(item,index) in list" :key="index">
                    <el-form size="mini" :model="item" :inline='true'>
                        <el-form-item label="客户号：">
                            <span>{{item.CustomerNo}}</span>
                        </el-form-item>
                        <el-form-item label="客户名称：">
                            <span>{{item.CustomerName}}</span>
                        </el-form-item>
                        <el-form-item label="单位/个人客户标识">
                            <span>{{item.GrpIndiidentify}}</span>
                        </el-form-item>
                         <el-form-item label="联系人">
                            <span>{{item.Contact}}</span>
                        </el-form-item>
                         <el-form-item label="联系电话">
                            <span>{{item.ConPhone}}</span>
                        </el-form-item>
                        <el-button plain style="margin-right:20px" @click="viewDetail(item)">【查看客户信息】</el-button>
                        <el-button plain @click="edit(item)">【编辑客户信息】</el-button>
                    </el-form>
                </li>
                <li v-if="!list.length>0" style="width:100%;color:#999;text-aline:center;padding-bottom:10px;display:flex;justify-content: space-around;">暂无数据</li>
            </ul>
        </div>
        <el-dialog
          :title="title"
          :visible.sync="dialogFormVisible"
          :close-on-click-modal='false'
          :close-on-press-escape='false'
          class="dialog"
          width='70%'
          height="500px"
          style="overflow: auto;"
          :before-close='handleAddClose'>
            <el-form :label-position="labelPosition" ref="formLabelAlign" label-width="80px"  class="demo-form-inline">
                <el-form-item label="客户号:" label-width="100px">
                   <span v-if="IsviewDetail">{{formLabelAlign.CustomerNo}}</span>
                   <el-input v-model="formLabelAlign.CustomerNo" placeholder="客户号" v-else></el-input>
                </el-form-item>
                <el-form-item label="客户名称:" label-width="100px">
                    <span v-if="IsviewDetail">{{formLabelAlign.CustomerName}}</span>
                    <el-input v-model="formLabelAlign.CustomerName" placeholder="客户名称" v-else></el-input>
                </el-form-item>
                <el-form-item label="客户标识:" label-width="100px">
                    <span v-if="IsviewDetail">{{formLabelAlign.GrpIndiidentify}}</span>
                    <el-input v-model="formLabelAlign.GrpIndiidentify" placeholder="客户标识" v-else></el-input>
                </el-form-item>
                <el-form-item label="联系人1:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Contact}}</span>
                     <el-input v-model="formLabelAlign.Contact" placeholder="联系人1" v-else></el-input>
                </el-form-item>
                <el-form-item label="联系电话1:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.ConPhone}}</span>
                     <el-input v-model="formLabelAlign.ConPhone" placeholder="联系电话1" v-else></el-input>
                </el-form-item>
                <el-form-item label="手机1:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.MobilePhone}}</span>
                     <el-input v-model="formLabelAlign.MobilePhone" placeholder="手机1" v-else></el-input>
                </el-form-item>
                <el-form-item label="Email:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.EMail}}</span>
                     <el-input v-model="formLabelAlign.EMail" placeholder="Email" v-else></el-input>
                </el-form-item>
                <el-form-item label="地址:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Address}}</span>
                      <el-input v-model="formLabelAlign.Address" placeholder="地址" v-else></el-input>
                </el-form-item>
                <el-form-item label="送货地址:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.ShipAddress}}</span>
                     <el-input v-model="formLabelAlign.ShipAddress" placeholder="送货地址" v-else></el-input>
                </el-form-item>
                <el-form-item label="销售人员代码:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.SalespersonCode}}</span>
                     <el-input v-model="formLabelAlign.SalespersonCode" placeholder="销售人员代码" v-else></el-input>
                </el-form-item>
                <el-form-item label="姓名:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Name}}</span>
                     <el-input v-model="formLabelAlign.Name" placeholder="姓名" v-else></el-input>
                </el-form-item>
                 <el-form-item label="客户首次询价方式:" label-width="130px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Way}}</span>
                     <el-select v-model="formLabelAlign.Way" placeholder="客户首次询价方式" v-else>
                      <el-option label="电话" value="电话"></el-option>
                      <el-option label="Email" value="Email"></el-option>
                      <el-option label="上门" value="上门"></el-option>
                    </el-select>
                </el-form-item>
                 <el-form-item label="联系人2:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Contact2}}</span>
                     <el-input v-model="formLabelAlign.Contact2" placeholder="联系人2" v-else></el-input>
                </el-form-item>
                <el-form-item label="联系电话2:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.ConPhone2}}</span>
                     <el-input v-model="formLabelAlign.ConPhone2" placeholder="联系电话2" v-else></el-input>
                </el-form-item>
                <el-form-item label="手机2:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.MobilePhone2}}</span>
                     <el-input v-model="formLabelAlign.MobilePhone2" placeholder="手机2" v-else></el-input>
                </el-form-item>
                <el-form-item label="Email2:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Email2}}</span>
                     <el-input v-model="formLabelAlign.Email2" placeholder="Email2" v-else></el-input>
                </el-form-item>
                <el-form-item label="URL:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.URL}}</span>
                     <el-input v-model="formLabelAlign.URL" placeholder="URL" v-else></el-input>
                </el-form-item>
                <el-form-item label="行业:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.BusinessType}}</span>
                     <el-input v-model="formLabelAlign.BusinessType" placeholder="行业" v-else></el-input>
                </el-form-item>
                <el-form-item label="黑名单标记:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.BlacklistFlag}}</span>
                    <el-select v-model="formLabelAlign.BlacklistFlag" placeholder="黑名单标记" v-else>
                      <el-option label="无" value="0"></el-option>
                      <el-option label="有" value="1"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="信用状况:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Quality | QualityFilter}}</span>
                     <el-select v-model="formLabelAlign.Quality" placeholder="信用状况" v-else>
                      <el-option label="无" value="0"></el-option>
                      <el-option label="有" value="1"></el-option>
                      <el-option label="无" value="0"></el-option>
                      <el-option label="有" value="1"></el-option>
                      <el-option label="无" value="0"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="介绍人姓名:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.IntroducerName}}</span>
                     <el-input v-model="formLabelAlign.IntroducerName" placeholder="介绍人姓名" v-else></el-input>
                </el-form-item>
                 <el-form-item label="联系方式:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.IntroducerPhone}}</span>
                     <el-input v-model="formLabelAlign.IntroducerPhone" placeholder="联系方式" v-else></el-input>
                </el-form-item>
                 <el-form-item label="介绍公司:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.Company}}</span>
                     <el-input v-model="formLabelAlign.Company" placeholder="介绍公司" v-else></el-input>
                </el-form-item>
                 <el-form-item label="联系方式:" label-width="100px">
                     <span v-if="IsviewDetail">{{formLabelAlign.CompanyPhone}}</span>
                     <el-input v-model="formLabelAlign.CompanyPhone" placeholder="联系方式" v-else></el-input>
                </el-form-item>
                <el-form-item label="操作人:" label-width="100px" v-if="IsviewDetail">
                     <span >{{formLabelAlign.OperatorID}}</span>
                </el-form-item>
                <el-form-item label="操作日期:" label-width="100px" v-if="IsviewDetail">
                     <span >{{formLabelAlign.MakeDate}}</span>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer" v-if="IsviewDetail">
              <el-button size="mini" @click="contribution">客户贡献度</el-button>
            </div>
            <div slot="footer" class="dialog-footer" v-if="!IsviewDetail">
                <el-button size="mini" @click="handleAddClose">取 消</el-button>
                <el-button size="mini" @click="SaveInfo"  class="changeColor">保 存</el-button>
              </div>
        </el-dialog>
        <div class="contribution">
            <el-dialog
              title="客户贡献度"
              :visible.sync="contributionShow"
              :close-on-click-modal='false'
              :close-on-press-escape='false'
              class="dialog"
              width='70%'
              height="500px"
              style="overflow: auto;"
              :before-close='CloseShow'>
                <el-form :label-position="labelPosition" ref="contributionForm" label-width="80px"  class="demo-form-inline">
                    <el-form-item label="开始时间">
                        <el-date-picker type="date" placeholder="开始时间" v-model="contributionForm.startTime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                    <el-form-item label="结束时间">
                        <el-date-picker type="date" placeholder="结束时间" v-model="contributionForm.endTime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                    <el-form-item label="产品名称:" label-width="100px">
                      <el-input v-model="contributionForm.ProductName" placeholder="产品名称" ></el-input>
                    </el-form-item>
                </el-form>
                <el-row style="padding-top:10px;">
                  <el-col :span="7" :offset="17">
                      <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
                  </el-col>
                </el-row>

                <div class="contributionList">
                  <span>订单总数为：{{tableData.length}}，订单总金额为：20000</span>
                    <el-table
                      v-loading="tableLoading"
                      ref="basicIndexTable"
                      :data="tableData"
                      style="width: 100%">
                    <el-table-column
                      prop="Name"
                      label="名称"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="RoleName"
                      label="报价单号"
                     >
                    </el-table-column>
                    <el-table-column
                      prop="RoleID"
                      label="订单号"
                     >
                    </el-table-column>
                    <el-table-column
                      prop="RoleDesc"
                      label="产品名称"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="RoleStatus"
                      label="产品描述"
                     >
                    </el-table-column>
                    <el-table-column
                      prop="MakeDate"
                      label="订单日期"
                     >
                    </el-table-column>
                    <el-table-column
                      prop="OperatorID"
                      label="单价"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="Updatetime"
                      label="金额"
                     >
                    </el-table-column>
                    <el-table-column
                      prop="UpdateOperatorID"
                      label="折扣比例"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="UpdateOperatorID"
                      label="invoice号码"
                      >
                    </el-table-column>
                     <el-table-column
                      prop="UpdateOperatorID"
                      label="GST值"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="UpdateOperatorID"
                      label="销售人员"
                      >
                    </el-table-column>
                    <el-table-column
                      prop="UpdateOperatorID"
                      label="branch代码"
                      >
                    </el-table-column>
                  </el-table>
                  <el-pagination class="current"
                    @current-change="handleCurrentChange"
                    :current-page="currentpages"
                    :page-size="pagesize"       
                    layout="total, prev, pager, next"
                    :total="total"> 
                </el-pagination>
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
  name: "customerManage",
  data() {
    return {
        dialogFormVisible:false,//查看修改弹框
        contributionShow:false,//贡献度弹框
        IsviewDetail:true,//是否为详情
        currentpages:1,
        pagesize:10,
        total:0,
        title:"查看客户信息",
        tableData:[],//贡献度数据列表
        contributionForm:{//贡献度查询条件
          startTime:"",
          endTime:"",
          ProductName:""
        },
        formInline:{//客户查询条件
            Number: '',
            Name:"",
        },
        formLabelAlign:{},//查看跟修改数据
        labelPosition: 'right',
        list:[{CustomerNo:"2412414",CustomerName:"张三",GrpIndiidentify:"个人",Contact:"张三",ConPhone:13423456752}],
    };
  },

  created: function() {
    
  },
  methods: {
    handleCurrentChange(val){
        console.log(val)
    },
    seachSubmit(){
        this.$message({message:'点击了查询按钮'});
    },
    viewDetail(item){
        this.dialogFormVisible = true;
        this.formLabelAlign = item;
        this.IsviewDetail = true;
        this.title = "查看客户信息"
    },
    edit(item){
      this.dialogFormVisible = true;
      this.IsviewDetail = false;
      this.formLabelAlign = item;
      this.title = "编辑客户信息"
    },
    handleAddClose(){
        this.dialogFormVisible = false;
        this.formLabelAlign = {};
    },
    CloseShow(){
      this.contributionShow = false;
      this.dialogFormVisible = true;
    },
    contribution(){
      this.dialogFormVisible = false;
      this.contributionShow = true;
    },
    SaveInfo(){
      console.log("1111")
      this.$confirm('是否保存当前修改?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$message({
            type: 'success',
            message: '保存成功!'
          });
          this.dialogFormVisible = false;
        }).catch(() => {      

        });
        
    },
    getTime(){
        let time = new Date();
        let year = time.getFullYear();
        let month = time.getMonth()+1;
        if(month<10){
            month = "0"+month;
        }
        let day = time.getDate();
        if(day<10){
            day = "0"+day;
        }
        let hour = time.getHours();
        if(hour<10){
            hour = "0"+hour;
        }
        let min = time.getMinutes();
        if(min<10){
            min = "0"+min;
        };
        let second = time.getSeconds();
        if(second<10){
            second = "0"+second;
        }
        return year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;
    }
  },
  filters:{
    QualityFilter(val){
      if(!val){
        return "";
      }
      if(val<0 || val<100){
        return "五级";
      }else if(val>=100 && val<500){
        return "四级";
      }else if(val>=500 && val<1000){
        return "三级";
      }else if(val>=1000 && val<10000){
        return "二级";
      }else{
        return "一级";
      }
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
              width:30%
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
      .dingDanlist{
        background: #fff;
        width: 100%;
        ul{
           padding: 0;
            li{
              list-style: none;
              width:100%;
              display: flex;
              padding: 20px 20px 0;
              border-bottom: 1px solid #eee;
              span{
                  margin-right: 20px;
                  font-size: 18px;
              }
              div{
                padding-bottom: 10px;
                span{
                    font-size: 12px;
                    color:#333;
                }
                .el-row{
                    margin-top: 10px;
                }
              }
            }
        }
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
