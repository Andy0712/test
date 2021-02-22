import cryptoJs from 'crypto-js'

//let iv ='12345678'
// DES加密
export const encryptDesKey = (message, key,iv) => {
  var keyHex = cryptoJs.enc.Utf8.parse(key) ;
  var ivHex = cryptoJs.enc.Utf8.parse(iv);

  var option = {iv: ivHex, mode: cryptoJs.mode.CBC, padding: cryptoJs.pad.Pkcs7 }
  var encrypted = cryptoJs.TripleDES.encrypt(message, keyHex, option)
  return encrypted.toString()
}

// DES解密
export const decryptDesKey = (message, key,iv) => {
  var keyHex = cryptoJs.enc.Utf8.parse(key)
  var ivHex = cryptoJs.enc.Utf8.parse(iv);
  var decrypted = cryptoJs.TripleDES.decrypt(
    {
//      ciphertext: cryptoJs.enc.Hex.parse(message)
      ciphertext:cryptoJs.enc.Base64.parse(message)
  },
    keyHex,
    {
      iv: ivHex,
      mode: cryptoJs.mode.CBC,
      padding: cryptoJs.pad.Pkcs7
    }
  )
  return decrypted.toString(cryptoJs.enc.Utf8)
}

// DES加密
export const encryptDes = (message) => {
  var key ='CgNVcryvA8r1FWHpXqjacVdxyFO1WEm7ZfP3xedhexdN9CG01mNmD6exnyMlAqQkjCYsmM0GIAyJgdHZsvXRRPGm'
  var iv='12345678'
  return encryptDesKey(message,key,iv)
}

// DES解密
export const decryptDes = (message) => {
  var iv='12345678'
  var key ='CgNVcryvA8r1FWHpXqjacVdxyFO1WEm7ZfP3xedhexdN9CG01mNmD6exnyMlAqQkjCYsmM0GIAyJgdHZsvXRRPGm'
  return decryptDesKey(message,key,iv)
}

// // DES加密
// export const encryptDesKey = (message, key, iv) => {
//   var keyHex = cryptoJs.enc.Utf8.parse(key)
//   var ivHex = cryptoJs.enc.Utf8.parse(iv)
//   var option = { iv: ivHex, mode: cryptoJs.mode.CBC, padding: cryptoJs.pad.Pkcs7 }
//   var encrypted = cryptoJs.DES.encrypt(message, keyHex, option)
//   return encrypted.ciphertext.toString()
// }
//
// // DES解密
// export const decryptDesKey = (message, key, iv) => {
//   var keyHex = cryptoJs.enc.Utf8.parse(key)
//   var ivHex = cryptoJs.enc.Utf8.parse(iv)
//   var decrypted = cryptoJs.DES.decrypt(
//     {
//       ciphertext: cryptoJs.enc.Hex.parse(message)
//     },
//     keyHex,
//     {
//       iv: ivHex,
//       mode: cryptoJs.mode.CBC,
//       padding: cryptoJs.pad.Pkcs7
//     }
//   )
//   return decrypted.toString(cryptoJs.enc.Utf8)
// }
