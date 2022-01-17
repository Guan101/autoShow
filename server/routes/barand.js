// 加载Express模块
const express = require('express');
const pool = require('../pool');
// 创建路由对象
const barand = express.Router();
// 品牌导航   http://127.0.0.1:3000/barand
// 通过品牌 id 查询 销售点信息
barand.get('/shops', (req, res, next) => {
  let sid = req.query.sid
  let cityName = req.query.cityName
  console.log(sid);
  // and cityname = %like?%
  // let sql = 'select * from shops where shop_b_id = ?';
  let sql = 'select * from shops where  shop_b_id = ? && shop_address like ?'
  pool.query(sql, [sid, `%${cityName}%`], (err, result) => {
    if (err) next(err)
    if (result) {
      res.send({ status: 1, result })
    } else {
      res.send({ status: 0, msg: err })
    }
  })
})

barand.get('/barand', (req, res) => {
  // 获取客户端传递的page参数
  let page = req.query.page ? req.query.page : 1;
  // 存储每页显示的个数
  let pagesize = 7;
  // 通过公式来计算从第几条记录开始返回
  let offset = (page - 1) * pagesize;
  // 用于存储获取到的总记录数
  let rowcount;
  // 当前页数
  let sql = `select * from barand limit ${offset},7`;
  // SQL语句以获取品牌列表
  // let sql = 'SELECT * FROM barand';
  // 执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: 'ok', code: 200, results: results });
  });
});
// 拿到全部品牌logo
barand.get('/barands', (req, res) => {
  // SQL语句以获取品牌列表
  let sql = 'SELECT * FROM barand';
  // 执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: 'ok', code: 200, results: results });
  });
});
// 拿到单个的图片和名字   http://127.0.0.1:3000/barand
barand.get('/carName/:b_id', (req, res) => {
  let obj = req.params;
  // SQL语句以获取品牌列表
  let sql = 'SELECT * FROM barand where b_id = ?';
  // 执行SQL语句
  pool.query(sql, [obj.b_id], (error, results) => {
    if (error) throw error;
    res.send({ message: 'ok', code: 200, results: results });
  });
});
// 品牌导航后图片   http://127.0.0.1:3000/b_pic
barand.get('/b_pic/:bmm_id', (req, res) => {
  // SQL语句以获取文章分类表的数据
  let obj = req.params;
  let sql = 'SELECT * FROM b_pic where bmm_id = ?';
  // 执行SQL语句
  pool.query(sql, [obj.bmm_id], (error, results) => {
    if (error) throw error;
    res.send({ message: 'ok', code: 200, results: results });
  });
});
// // 添加活动查询路由
// barand.get('/search/:acity', (req, res, next) => {
//   // console.log(req.params);
//   pool.query('SELECT * FROM activity WHERE a_city = ?', [req.params.acity], (err, result) => {
//     if (err) {
//       next(err);
//       //阻止往后执行
//       return;
//     }
//     // console.log(result);
//     if (result.length == 0) {
//       res.send({ code: 201, msg: '暂时没有活动', data: result });
//     } else {
//       res.send({ code: 200, msg: '活动查询成功', data: result });
//     }
//   });
// });
// 导出路由器对象
module.exports = barand;
