const express = require('express');
//引入连接池模块
const pool = require('../pool');
//创建路由器对象
const news = express.Router();

// 添加活动查询路由
news.get('/search', (req, res, next) => {
  // console.log(req.params);
  pool.query('SELECT * FROM news order by n_id desc', (err, result) => {
    if (err) {
      next(err);
      //阻止往后执行
      return;
    }
    // console.log(result);
    if (result.length == 0) {
      res.send({ code: 201, msg: '暂时没有资讯', data: result });
    } else {
      res.send({ code: 200, msg: '资讯查询成功', data: result });
    }
  });
});

//导出路由器对象
module.exports = news;
