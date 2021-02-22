<template>
  <!-- 生产确认处理--生产人员一种，销售人员一种 -->
  <div class="login-wrapper">
    <div class="basicIndex-wrapper">
      <div class="head">
        <div class="title">
          <i class="el-icon-caret-right"></i>
          <span>生产确认处理</span>
        </div>
        <el-form
          :inline="true"
          :model="formInline"
          size="mini"
          class="form"
          label-position="left"
          label-width="95px"
        >
          <!-- 客户名称	文本		
	报价单号	文本		
	业务类型	文本		
	订单号	文本		
	审批人	下拉框	是	
	请求确认描述	文本框	是	
	确认状态	文本		
	确认意见	文本		
	生产人员备注	文本		
          提交生产确认	按钮-->
          <div class="formLine">
            <el-form-item label="客户名称">
              <el-input v-model="formInline.name" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="报价单号：">
              <el-input v-model="formInline.number" placeholder="请输入"></el-input>
            </el-form-item>
            <!-- 业务类型应该是需要是单选框 -->
            <el-form-item label="业务类型：">
              <el-input v-model="formInline.name" placeholder="请输入"></el-input>
            </el-form-item>
          </div>
          <!-- 审批人应该是根据后台信息展示下拉选-->
          <div class="formLine">
            <el-form-item label="审批人：">
              <el-input v-model="formInline.number" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="订单号：">
              <el-input v-model="formInline.name" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="联系电话：">
              <el-input v-model="formInline.number" placeholder="请输入"></el-input>
            </el-form-item>
          </div>
        </el-form>
        <div class="form-oper">
          <el-button
            size="mini"
            icon="el-icon-search"
            class="search changeColor"
            @click="seachSubmit"
          >查询</el-button>
        </div>
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
  name: "proConfir",
  data() {
    return {
      formInline: {
        name: "",
        number: "",

        currentPage4: 4, //分页
      },
    };
  },

  created: function () {},
  methods: {
    seachSubmit() {},
    customerInfo() {
      console.log("客户一");
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
    },
    handleCurrentChange(val) {
      console.log(`当前页: ${val}`);
    },
  },
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
  padding: 10px 20px;
}

.el-scrollbar {
  width: 100%;
}

.el-date-editor {
  width: 100%;
}

.changeColor {
  background: #007eff !important;
  // background: chartreuse;
  // background-image: url("../../../../static/img/btn_search.png");
  // background-size: 100% 100%;
  color: #fff;
}
// 整个内部区域
.login-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 21px 16px;
  background: #f2f2f6;
  // 内部展示区域
  .basicIndex-wrapper {
    position: relative;
    width: 100%;
    height: auto;

    // 上部区域
    .head {
      border-radius: 7px;
      overflow: hidden;
      .title {
        width: 100%;
        box-sizing: border-box;
        height: 44px;
        line-height: 44px;
        padding: 0 18px;
        font-size: 12px;
        background: #fff;
        border-bottom: 1px solid #eeeeee;
        border-top-left-radius: 7px;
        border-top-right-radius: 7px;
        overflow: hidden;
      }
      .form {
        width: 100%;
        background: #fff;
        box-sizing: border-box;
        padding: 22px;
        padding-bottom: 10px;
        .formLine {
          width: 100%;
          display: flex;
          flex-direction: row;
          justify-content: space-between;
        }
        .el-form-item {
          // margin-right: 30px ;
          .el-form-item__label {
            padding: 0px;
          }
        }
        .el-row {
          padding-bottom: 13px;
          .el-col {
            height: 40px;
            line-height: 40px;
          }
        }
      }
      // 查询按钮
      .form-oper {
        background: #fff;
        box-sizing: border-box;
        padding: 18px;
        padding-right: 28px;
        text-align: right;
        .el-button {
          width: 120px;
          color: #fff;
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
          color: #fff;
        }
      }
    }
    .dingDanlist {
      background: #fff;
      width: 1608px;
      margin-top: 10px;
      border-radius: 7px;
      overflow: hidden;
      .listBox {
        // width: 500%;
        // display: inline-block;
        font-size: 0px;
        overflow-x: scroll;
        white-space: nowrap;
        ul {
          padding: 0px;
          margin: 0px;
          display: inline-block;
          box-sizing: border-box;
          li {
            display: block;
            height: 70px;
            list-style: none;
            line-height: 69px !important;
            text-align: center;
            border-bottom: 1px solid #e2e2e5;
            padding-left: 16px;
            padding-right: 16px;
            box-sizing: border-box;
            font-size: 18px;
            font-family: PingFang SC;
            border-right: 1px solid #e2e2e5;
            color: #666666;
            .button {
              color: #ffffff;
            }
            .button1 {
              background-color: #ffa800;
            }
          }
          li:first-child {
            background-color: #f6fbff;
            color: #343434;
            font-weight: bold;
          }
        }
      }
      .block {
        height: 100px;
        width: 100%;
        text-align: right;
        padding-top: 40px;
        box-sizing: border-box;
      }
    }
  }
}
</style>
