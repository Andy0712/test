<template>
  <!--公用表单头部-->
  <div class="common-form">
    <div class="title">
      <search-header></search-header>
    </div>
    <div class="form">
      <el-form
        ref="commonForm"
        :model="formData"
        label-width="280px"
        size="mini"
        v-show="Arr.length === 2"
      >
        <el-row>
          <el-col :span="6">
            <el-form-item :label="Arr[0]" prop="measure_no">
              <el-select
                v-if="optionArr.length"
                v-model.trim="formData.measure_no"
                :placeholder="'请选择' + Arr[0]"
                size="mini"
              >
                <el-option
                  v-for="item in optionArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
              <el-input v-else v-model.trim="formData.measure_no" :placeholder="'请输入' + Arr[0]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" :offset="2">
            <el-form-item :label="Arr[1]" prop="local_no">
              <el-input v-model.trim="formData.local_no" :placeholder="'请输入' + Arr[1]"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <el-form
        ref="commonForm"
        :model="formData"
        label-width="120px"
        size="mini"
        v-show="Arr.length === 3"
      >
        <el-row>
          <el-col :span="6">
            <el-form-item :label="Arr[0]" prop="measure_no">
              <el-select
                v-if="optionArr.length"
                v-model.trim="formData.measure_no"
                :placeholder="'请选择' + Arr[0]"
                size="mini"
              >
                <el-option
                  v-for="item in optionArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
              <el-input v-else v-model.trim="formData.measure_no" :placeholder="'请输入' + Arr[0]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" :offset="2">
            <el-form-item :label="Arr[1]" prop="local_no">
              <el-input v-model.trim="formData.local_no" :placeholder="'请输入' + Arr[1]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" :offset="2">
            <el-form-item :label="Arr[2]" prop="local_name">
              <el-input v-model.trim="formData.local_name" :placeholder="'请输入' + Arr[2]"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <el-form
        ref="pareterForm"
        :model="paramForm"
        label-width="100px"
        size="mini"
        v-show="Arr.length === 4"
      >
        <el-row>
          <el-col :span="6" :offset="2">
            <el-form-item :label="Arr[0]" prop="measure_name">
              <el-input v-model.trim="paramForm.measure_name" :placeholder="'请输入' + Arr[0]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" :offset="3">
            <el-form-item :label="Arr[1]" prop="param_type">
              <el-select v-model.trim="paramForm.param_type" :placeholder="'请选择' + Arr[1]">
                <el-option
                  v-for="item in optionArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6" :offset="2">
            <el-form-item :label="Arr[2]" prop="rank_name">
              <el-input v-model.trim="paramForm.rank_name" :placeholder="'请输入' + Arr[2]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" :offset="3">
            <el-form-item :label="Arr[3]" prop="param_name">
              <el-input v-model.trim="paramForm.param_name" :placeholder="'请输入' + Arr[3]"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <el-form
        ref="functionForm"
        :model="funcForm"
        label-width="100px"
        size="mini"
        v-show="Arr.length === 5"
      >
        <el-row>
          <el-col :span="5" :offset="2">
            <el-form-item :label="Arr[0]" prop="measure_name">
              <el-input v-model.trim="funcForm.measure_name" :placeholder="'请输入' + Arr[0]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="5" :offset="2">
            <el-form-item :label="Arr[1]" prop="param_type">
              <el-select v-model.trim="funcForm.param_type" :placeholder="'请选择' + Arr[1]">
                <el-option
                  v-for="item in optionArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="5" :offset="2">
            <el-form-item :label="Arr[2]" prop="rank_name">
              <el-input v-model.trim="funcForm.rank_name" :placeholder="'请输入' + Arr[2]"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="5" :offset="2">
            <el-form-item :label="Arr[3]" prop="param_name">
              <el-input v-model.trim="funcForm.param_name" :placeholder="'请输入' + Arr[3]"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="5" :offset="2">
            <el-form-item :label="Arr[4]" prop="func_name">
              <el-input v-model.trim="funcForm.func_name" :placeholder="'请输入' + Arr[4]"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
    <div class="form-oper">
      <el-row>
        <el-col :span="7" :offset="17">
          <el-button size="mini" class="reset" @click="reset">重置</el-button>
          <el-button size="mini" class="search changeColor" @click="search">查询</el-button>
        </el-col>
      </el-row>
    </div>
  </div>
</template>
<script>
import SearchHeader from "./searchHeader";
export default {
  name: "common-form",
  components: {
    SearchHeader
  },
  data() {
    return {
      formData: {
        measure_no: "",
        local_no: "",
        local_name: ""
      },
      paramForm: {
        measure_name: "",
        param_type: "",
        rank_name: "",
        param_name: ""
      },
      funcForm: {
        measure_name: "",
        param_type: "",
        rank_name: "",
        param_name: "",
        func_name: ""
      },
      Arr: []
    };
  },
  props: {
    labelArr: {
      typeof: Array
    },
    optionArr: {
      typeof: Array
    }
  },
  created() {
    _.forEach(this.labelArr, e => {
      this.Arr.push(e.label);
    });
  },
  methods: {
    reset() {
      this.$refs.commonForm.resetFields();
      this.$refs.pareterForm.resetFields();
      this.$refs.functionForm.resetFields();
    },
    search() {
      if (this.Arr.length === 3) {
        let row = _.cloneDeep(this.formData);
        this.$emit("search", row);
        // this.reset()
      } else if (this.Arr.length === 4) {
        let row = _.cloneDeep(this.paramForm);
        this.$emit("search", row);
        // this.reset()
      } else if (this.Arr.length === 5) {
        let row = _.cloneDeep(this.funcForm);
        this.$emit("search", row);
        // this.reset()
      }
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
.el-input {
  width: 200px;
}
.common-form {
  width: 100%;
  height: auto;
  background: #fff;
  box-sizing: border-box;
  .form {
    width: 100%;
    box-sizing: border-box;
    padding-top: 22px;
    padding-left: 12px;
    padding-bottom: 4px;
    border-bottom: 1px solid #eee;
  }
  .form-oper {
    box-sizing: border-box;
    padding-top: 18px;
    padding-bottom: 18px;
    border-bottom: 1px solid #eeeeee;
    .reset {
      background: #eee;
      color: #666;
      margin-right: 12px;
    }
    .search {
      background: red;
      color: #fff;
    }
  }
}
</style>
