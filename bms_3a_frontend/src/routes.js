/**
 * Author: AZW
 * Date: 2021/1/18
 * Desc: 路由管理
 */
// 登录模块路由
import login from "./module/login/route";
import branch from "./module/branch/route";//branch管理
import management from "./module/management/route";//角色管理
import RolePerManage from "./module/RolePerManage/route";//角色权限管理
import userPrivManage from './module/userPrivManage/route';//用户权限管理
import userManage from './module/userManage/route';//用户管理
import customerInfor from './module/customerInfor/route';//客户信息查询
import ProductionTask from "./module/ProductionTask/route";//生产任务查询
import orderInquiry from "./module/orderInquiry/route";//订单查询
import receipts from "./module/receipts/route";//应收应付查询
import inventory from "./module/inventoryMaintenance/route";//库存维护
import customerManage from "./module/customerManage/route";//客户管理
import invoiceManage from "./module/invoiceManage/route";//invoice查询
export default [
  {
    path: "/QuotationOrderInquiry",
    component: resolve => require(["./module/container"], resolve), //懒加载
    meta: { breadName: "报价单及订单查询", title: "报价单及订单查询", hidden: true },
    children: [
      {
        name: "QuotationOrderInquiry",
        path: "",
        // component: resolve => require(['./module/welcome/components/welcome'], resolve),
        // component: resolve => require(["./module/index/home"], resolve),
        component:resolve => require(['./module/QuotationOrderInquiry/components/QuotationOrderInquiry'],resolve),
        meta: { breadName: "报价单及订单查询", title: "报价单及订单查询", hidden: true,Ptitle:"销售管理" }
      },
      ...branch,
      ...management,
      ...RolePerManage,
      ...userPrivManage,
      ...userManage,
      ...customerInfor,
      ...ProductionTask,
      ...orderInquiry,
      ...receipts,
      ...inventory,
      ...customerManage,
      ...invoiceManage
    ]
  },
  ...login,
  {
    name: "404",
    path: "*",
    component: resolve => require(["./module/404"], resolve),
    meta: { breadName: "404找不到页面", title: "404找不到页面" }
  }
];
