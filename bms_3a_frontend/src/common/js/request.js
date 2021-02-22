import invokers from "../../invokers";
import { encryptDes, decryptDes } from "./des";
let Base64 = require("js-base64").Base64;
/**
 * 公用post请求
 * @param {string} url(必填) 请求地址
 * @param {object} data(必填) 请求数据
 * @param {string} host(选填) 域名
 * @param {string} key(选填) 参数对应key值
 * @returns {Promise}
 */

export default (url = "", data = {}, host = "",Type = "") => {
  invokers.domains[host].interceptors.request.use(
    config => {
      config.responseType = "";
      return config;
    },
    error => {
      console.log(error)
      return Promise.reject(error);
    }
  );

  // invokers.domains[host].interceptors.response.use(
  //   response => {
  //     console.log(
  //       "响应===>",
  //       JSON.parse(decryptDes(Base64.decode(response.data)))
  //     );
  //     return response;
  //   },
  //   error => {
  //     return Promise.reject(error);
  //   }
  // );
  let token = "";
  if(sessionStorage.getItem("userInfo")){
    token = JSON.parse(sessionStorage.getItem("userInfo")).token;
  }
  return invokers.domains[host].post(url, data,{headers:{Authorization:token,"Content-Type":Type},timeout:10000});
};

