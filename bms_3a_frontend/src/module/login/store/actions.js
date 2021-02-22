/**
 * author : AZW
 * time : 2020/12/21
 * desc : 登录
 *
 */
import invokers from "../../../invokers";
import request from "../../../common/js/request";
import * as constants from "./constants";
import { encryptDes, decryptDes } from "../../../common/js/des"; // 引用路径根据自己的文件结构而定
import storage from "../../../common/js/storage";
import Cookies from "js-cookie";
let Base64 = require("js-base64").Base64;
const LOGIN_KEY = "userInfo";
const MENULIST = "menuList";
const NAV = "nav";
const LOGIN = "login";
const MENU = []
// 执行登入
export async function DO_LOGIN_IN({ commit }, payload) {
  let params = {
    username: payload.userName,
    password: payload.passWord,
  };
  console.log("login==>", params);
  //console.log(payload.rndCode,24);
  // alert(encryptDes('1231231312dfsdf'));
  // console.log(encryptDes('1231231312dfsdf'));
  // alert(decryptDes('2dyLDqvEYuF/L1/HavwKXA=='))
  // console.log(decryptDes('2dyLDqvEYuF/L1/HavwKXA=='));
  // console.log(encryptDes(encodeURIComponent(`${params}`)));
  // console.log(Base64.encode(encryptDes(encodeURIComponent(`${params}`))));
  let res = await request(
    invokers.services.LOGIN.DO_LOGIN,
    params,
    "branch",
    'application/json'
  );
  let result;
  if (res.data.successful) {
    let user = {
      userName: 'admin',
      userId: 1,
      loginSuccess: true,
      token: res.data.result.token,
      roleName: '超级管理员',
      // roleNo: result.roleNo,
      // loginTime: result.loginTime,
      // userNo: result.user_no
    };
    // sessionStorage.setItem("token",res.data.result.token);
    sessionStorage.setItem("userInfo",JSON.stringify(user))
    storage.locals.set(LOGIN_KEY, user);
    storage.cookie.set("login", true, { expires: 1 });
  //   let obj = {};
  //   let now = [];
  //   let menuList = [];
  //   _(list).forEach(e => {
  //     let menu_url;
  //     menu_url = e.menu_url.split("|");
  //     if (menu_url.length === 2) {
  //       obj.menu_order = e.menu_order;
  //       obj.menu_name = e.menu_name;
  //       obj.path = menu_url[0];
  //       obj.class = menu_url[1];
  //       let row = _.cloneDeep(obj);
  //       menuList.push(row);

  //       //menuList = _.orderBy(menuList , ['menu_order']) //排序
  //       menuList.map(e => {
  //         e.show = false;
  //       });
  //     }
  //   });
    // storage.locals.set(MENULIST, MENU);
    commit(constants.LOGIN_IN, user);
  // } else {
  //   commit(constants.LOGIN_IN, { userName: null, loginSuccess: false });
  //   result = res.msg[0].message;
  // }
  return user;
}
}
// 执行登出
export async function DO_LOGIN_OUT({ commit }) {
  sessionStorage.clear();
  let userInfo = storage.locals.get("userInfo");
  let params = {
    token: userInfo ? userInfo.token : ""
  };
  params = JSON.stringify(params);
  // let res = await request(
  //   invokers.services.LOGIN.LOGIN_OUT,
  //   Base64.encode(encryptDes(encodeURIComponent(`${params}`))),
  //   "uspa"
  // );
  // res = JSON.parse(decryptDes(Base64.decode(res.data)));
  // if ((res.flag = "success")) {
  //   commit(constants.LOGIN_OUT);
  //   this.commit("index/DEL_ALL_VIEWS_LIST");
  //   storage.locals.remove("userInfo");
  //   storage.cookie.remove("login");
  //   return 200;
  // } else if (res.flag === "fail") {
  //   return { login: false };
  // }
  return "服务出错，稍后重试";
}

// 用户忘记密码，获取自己的用户信息
// 获取用户的身份信息
export async function fetchAuth({ commit }) {
  let userInfo = storage.locals.get("userInfo") || {
    userName: null,
    loginSuccess: false
  };
  commit(constants.FETCH_AUTH, userInfo);
}
