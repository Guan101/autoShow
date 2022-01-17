const express = require('express');
//引入连接池模块
const pool = require('../pool');
//创建路由器对象
const tuser = express.Router();
// 查询游客信息路由
tuser.post('/tuserInfo',(req,res,next)=>{
  let obj = req.body
  // console.log(obj);
  pool.query(' SELECT * FROM tuser WHERE t_uid = ?;',[obj.t_uid],(err,result)=>{
    if(err){
      next(err)
      return
    }
    if(result.length==0){
      res.send({ code: 201, msg: '暂无游客信息请添加', data: result });
    }else{
      res.send({ code: 200, msg: '游客信息查询成功', data: result });
    }
  })
})

// 添加游客信息路由
tuser.post('/tuser',(req, res, next) => {
  console.log(req.body);
  let obj = req.body
  // 先判断身份证是否存在
  pool.query('SELECT tidcard FROM tuser WHERE tidcard = ?',[obj.userID],(err,result)=>{
    if(err){
      next(err)
      return
    }
    // 判断用户是否存在
    if(result.length>0){
      res.send({ code: 202, msg: '用户已存在', data: result });
    }else{
      pool.query('INSERT INTO tuser VALUES(null,?,?,?,?);',[obj.userName,obj.userTel,obj.userID,obj.t_uid], (err, result) => {
        if (err) {
          next(err);
          //阻止往后执行
          return;
        }
        // console.log(result);
        if (result.length != 0) {
          res.send({ code: 200, msg: '插入成功', data: result });
        }
      });
    }
  })
});
//导出路由器对象
module.exports = tuser;
