const express = require('express');
//引入连接池模块
const pool = require('../pool');
//创建路由器对象
const p_order = express.Router();
// 查询订单信息路由
p_order.post('/p_orderInfo', (req, res, next) => {
  let obj = req.body
  // console.log(obj);
  pool.query(' SELECT * FROM p_order WHERE o_u_id = ?;', [obj.o_u_id], (err, result) => {
    if (err) {
      next(err)
      return
    }
    if (result.length == 0) {
      res.send({ code: 201, msg: '暂无订单信息快去购票吧', data: result });
    } else {
      res.send({ code: 200, msg: '订单信息查询成功', data: result });
    }
  })
})
// 订单表  场次名  日期  票数+1、游客表新增一条数据
// 遍历游客表 左联场次表

// 添加订单信息路由
p_order.post('/p_order', (req, res, next) => {
  console.log(req.body);
  let obj = req.body
  // 先判断订单id是否存在
  pool.query('SELECT tidcard FROM p_order WHERE tidcard = ?', [obj.tidcard], (err, result) => {
    if (err) {
      next(err)
      return
    }
    // 判断用户是否存在
    if (result.length > 0) {
      res.send({ code: 202, msg: '用户已存在', data: result });
    } else {
      // 当游客没有买过票时再插入订单数据
      pool.query('INSERT INTO p_order VALUES(?,?,?,?,?,?,?,?,?,?);', [obj.o_id, obj.o_u_id, obj.osen_id, obj.o_name, obj.o_number,obj.o_price,obj.o_time,obj.tname, obj.tphone, obj.tidcard], (err, result) => {
        if (err) {
          next(err);
          //阻止往后执行
          return;
        }
        console.log(result);
        if (result.length != 0) {
          res.send({ code: 200, msg: '订单已生成', data: result });
        }
      });
    }
  })
});
//导出路由器对象
module.exports = p_order;
