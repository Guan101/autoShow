// 引入express模块
const express = require('express')
// 引入连接池模块
const pool = require('../pool')
// 创建路由对象
const scene = express.Router()

// 添加场次查询路由 
scene.get('/sceneList/:id',(req,res,next)=>{
  // console.log(req.params);
  // 查询全部给他传递一个x
  if(req.params.id=='x'){
    pool.query('SELECT * FROM scene',(err,results)=>{
      if (err) throw err;
      res.send({ message: 'ok', code: 200, results: results });
    })
  }else{
    let obj = req.params.id
    // 请求单个传递id
    pool.query('SELECT * FROM scene where s_id = ?',[obj],(err,results)=>{
      if (err) throw err;
      res.send({ message: 'ok', code: 200, results: results });
    })
  }
})
// 想外暴露一个路由
module.exports = scene