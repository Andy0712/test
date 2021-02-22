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
                    <el-input v-model="formInline.rolename" placeholder="角色名称"></el-input>
                </el-form-item>
                <el-form-item label="角色代码">
                    <el-input v-model="formInline.roleno" placeholder="角色代码"></el-input>
                </el-form-item>
                <el-button size="mini"  style="background:#666;color:#fff;" class="info" @click="addSubmit">新增</el-button>
                <el-button size="mini" class="search changeColor" @click="seachSubmit">查询</el-button>
            </el-form>
        </div>
        <div class="table-oper">
          <el-row>
            <el-col>
              <el-button size="mini" class="changeColor" @click="upData">导入</el-button>
              <input type="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" class="file" hidden id="fileUp" @change="submit($event)">
              <el-button size="mini" class="changeColor" @click="downLoad">导出</el-button>
            </el-col>
          </el-row>
        </div>
        <div class="basicIndex-table">
          <el-table
          v-loading="tableLoading"
          ref="basicIndexTable"
          :data="tableData"
          max-height="380"
          style="width: 100%">
        <el-table-column
          prop="rolename"
          label="角色名称"
          width="120">
        </el-table-column>
        <!-- <el-table-column
          prop="roleno"
          label="角色代码"
          width="120">
        </el-table-column> -->
        <el-table-column
          prop="roledesc"
          label="角色描述"
          width="150">
        </el-table-column>
        <el-table-column
          prop="rolestatus"
          label="角色状态"
          width="120">
        </el-table-column>
        <el-table-column
          prop="crtdate"
          label="角色创建日期"
          width="150">
        </el-table-column>
        <el-table-column
          prop="crtuser"
          label="创建人"
          width="120">
        </el-table-column>
        <el-table-column
          prop="mdfdate"
          label="修改日期"
          width="150">
        </el-table-column>
        <el-table-column
          prop="mdfuser"
          label="修改人"
          width="150">
        </el-table-column>
        <el-table-column
          label="操作"
          width="150">
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="edit(scope.row)" style='width:30px;'>编辑</el-button>
            <el-button type="text" size="mini" @click="deleted(scope.row)" style='width:30px;'>删除</el-button>
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
              width="400px"
              :before-close='handleAddClose'>
            <el-form   ref="formLabelAlign" label-width="80px" :rules="rules" :model="formLabelAlign" class="demo-form-inline">
                <el-form-item label="角色名称" prop="rolename">
                    <el-input v-model="formLabelAlign.rolename"></el-input>
                </el-form-item>
                <!-- <el-form-item label="角色代码">
                    <el-input v-model="formLabelAlign.RoleID"></el-input>
                </el-form-item> -->
                <el-form-item label="角色描述" prop="roledesc"> 
                    <el-input type="textarea" v-model="formLabelAlign.roledesc"></el-input>
                </el-form-item>
            </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button size="mini" @click.stop="handleAddClose">取 消</el-button>
                <el-button size="mini" @click.stop="SubmitForm"  class="changeColor">保 存</el-button>
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
import domainsConfig from "../../../assets/conf/domains";
export default {
  name: "management",
  data() {
    return {
        dialogFormVisible:false,
        tableLoading: false,//表格loading
        currentPage:1,
        pagesize:10,
        total:0,
        showFile:true,//上传文件显示
        formInline:{
            rolename: '',
            roleno: '',
            "currpage": "",
            "pagesize": ""
        },
        formLabelAlign:{
            roledesc: '',
            rolename: '',
            // RoleDesc:""
        },
        tableData:[],
        fileList:[],
        rules: {
          roledesc: [
            { required: true, message: "不能为空"},
          ],
          rolename: [
            { required: true, message: '不能为空'},
          ],
        }
    };
  },

  created: function() {
    this.seachSubmit();
  },
  methods: {
    ...mapActions("management",{
      RoleAdd:"AddRole",
      SeachList:"seachList",
      DownLoad:"downLoad",
      Deleted:"deleted",
      Edit:"edit",
      Upload:"UpFile"
    }),
    async seachSubmit(){
      this.formInline.currpage = this.currentPage;
      this.formInline.pagesize = this.pagesize;
      let data = await this.SeachList(this.formInline);
      if(data.successful){
        this.tableData = data.result
        this.total = this.tableData.length;
      }else{
        let msg = "";
        for(let i=0;i<data.messages.length;i++){
          msg +=data.messages[i]+" "
        }
        this.$message({message:msg,type:"warning"});
      }
    },
    addSubmit(){
      this.dialogFormVisible = true;
    },
    SubmitForm(){
      this.$refs.formLabelAlign.validate(async (valid) => {
        if(valid){
          if(this.formLabelAlign.crtuser){
            let data = await this.Edit(this.formLabelAlign);
            if(data.successful){
              this.$message({message:"修改成功!",type:"success"});
              this.seachSubmit();
            }else{
              this.$message({message:"修改失败!",type:"warning"});
            }
            this.dialogFormVisible = false;
            this.$refs.formLabelAlign.resetFields();
          }else{
            let data = await this.RoleAdd(this.formLabelAlign);
            if(data.successful){
              this.$message({message:"添加成功!",type:"success"});
              this.dialogFormVisible = false;
              this.seachSubmit();
              this.$refs.formLabelAlign.resetFields();
            }
          }
        }
      })
    },
    upData(file){ //上传
      let fileUp = document.getElementById("fileUp");
      fileUp.click();
    },
    async submit(files){
      let form = new FormData();
      form.append("file",files.target.files[0]);
      let data = await this.Upload(form);
      // const loading = this.$loading({
      //     lock: true,
      //     text: '正在上传中',
      //     spinner: 'el-icon-loading',
      //     background: 'rgba(0, 0, 0, 0.7)'
      //   });
      //   setTimeout(() => {
      //     loading.close();
      //   }, 2000);
      console.log(data)
    },
    downLoad(){//导出
      let url = domainsConfig.domains.branch.baseURL;
      window.location.href = url+""+invokers.services.Role.downLoad;
      debugger
      return false;
    },
    async deleted(item){
      this.$confirm('确定删除该信息?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let data = await this.Deleted(item.roleno);
        if(data.successful){
          this.$message({message:"删除成功",type:"success"})
          this.seachSubmit();
        }
      }).catch(() => {
      });
      
    },
    handleAddClose(){
        this.dialogFormVisible = false;
        this.$refs.formLabelAlign.resetFields();
    },
    handleSizeChange(val) {
      this.pagesize = val;
      this.seachSubmit();
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.seachSubmit();
      console.log(`当前页: ${val}`);
    },
    edit(item){
      console.log(item)
      this.formLabelAlign = item;
      this.dialogFormVisible = true;

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
      .basicIndex-table{
        .el-button{
          margin-left: 0;
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
