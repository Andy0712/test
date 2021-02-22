/**
 * Author: AZW
 * Date: 2020/12/18
 * Desc: 全局 vuex 管理
 */
import Vuex from "vuex";
import Vue from "vue";
import login from "./module/login/store";
import index from "./module/index/store";
import branch from "./module/branch/store";//branch管理
import management from "./module/management/store";//角色管理
import RolePerManage from "./module/RolePerManage/store";//角色权限管理
import userPrivManage from './module/userPrivManage/store';//用户权限管理
import userManage from './module/userManage/store';//用户管理
import customerInfor from './module/customerInfor/store';//客户信息查询
import ProductionTask from "./module/ProductionTask/store";//生产任务查询
import orderInquiry from "./module/orderInquiry/store";//订单查询
import receipts from "./module/receipts/store";//应收应付查询
import inventory from "./module/inventoryMaintenance/store";//库存维护
import customerManage from "./module/customerManage/store";//客户管理
import invoiceManage from "./module/invoiceManage/store";//invoice查询
Vue.use(Vuex);
const modules = {
  login,
  index,
  branch,
  management,
  RolePerManage,
  userPrivManage,
  userManage,
  customerInfor,
  ProductionTask,
  orderInquiry,
  receipts,
  inventory,
  customerManage,
  invoiceManage
};
const data = {};
const state = {};
const store = new Vuex.Store({ state, modules, data });
export default store;
