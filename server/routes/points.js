const express = require('express');
//引入连接池模块
const pool = require('../pool');
//创建路由器对象
const points = express.Router();
// 商品查询接口
points.get('/search', (req, res, next) => {
  pool.query('SELECT * FROM product', (err, result) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    if (result.length == 0) {
      res.send({ code: 201, msg: '商品查询失败', data: result });
    } else {
      res.send({ code: 200, msg: '商品查询成功', data: result });
    }
  });
});
// 用户积分查询接口
points.get('/points', (req, res, next) => {
  let phone = req.query.phone;
  pool.query('SELECT u_name,u_points,u_address,phone FROM user where phone=?', [phone], (err, result) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    if (result.length == 0) {
      res.send({ code: 201, msg: '商品查询失败', data: result });
    } else {
      res.send({ code: 200, msg: '商品查询成功', data: result });
    }
  });
});
// 修改用户积分
points.put('/xgpoints', (req, res, next) => {
  let phone = req.body.phone;
  let u_points = req.body.u_points;
  pool.query('UPDATE user set u_points=? where phone=?', [u_points, phone], (err, data) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    if (data.affectedRows == 1) {
      res.send({
        code: 1,
        msg: '修改成功',
        data: data,
      });
    } else {
      res.send({
        code: 2,
        msg: '修改失败',
        data: data,
      });
    }
  });
});
// 修改商品数量
points.put('/xgproduct', (req, res, next) => {
  let p_num = req.body.p_num;
  let p_name = req.body.p_name;
  pool.query('UPDATE product set p_num=? where p_name=?', [p_num, p_name], (err, data) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    if (data.affectedRows == 1) {
      res.send({
        code: 1,
        msg: '修改成功',
        data: data,
      });
    } else {
      res.send({
        code: 2,
        msg: '修改失败',
        data: data,
      });
    }
  });
});
// 添加积分商品订单
points.post('/pporder', (req, res, next) => {
  let { po_pname, po_pic, po_points, po_addr, po_name, po_phone, po_time } = req.body;
  let u_id = +req.body.u_id;
  pool.query(
    'INSERT INTO pp_order values(null,?,?,?,?,?,?,?,?)',
    [po_pname, po_pic, po_points, po_addr, po_name, po_phone, po_time, u_id],
    (err, data) => {
      if (err) {
        next(err);
        //阻止往后执行
        return;
      }
      if (data.affectedRows == 1) {
        res.send({
          code: 1,
          msg: '添加成功',
          data: data,
        });
      } else {
        res.send({
          code: 2,
          msg: '添加失败',
          data: data,
        });
      }
    }
  );
});
// 查询积分商品订单
points.get('/pporder', (req, res, next) => {
  let u_id = +req.query.id;
  pool.query('SELECT * FROM pp_order where u_id=?', [u_id], (err, result) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    if (result.length == 0) {
      res.send({ code: 201, msg: '订单查询失败', data: result });
    } else {
      res.send({ code: 200, msg: '订单查询成功', data: result });
    }
  });
});
//导出路由器对象
module.exports = points;
