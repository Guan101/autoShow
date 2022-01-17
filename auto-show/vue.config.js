const path = require('path');
// 如果编辑器启用了代码检查功能，此行代码在编辑器中会报警

function resolve(dir) {
  return path.join(__dirname, dir);
}
module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        assets: '@/assets',
        components: '@/components',
        network: '@/network',
        views: '@/views',
      },
    },
  },
  chainWebpack: config => {
    config.plugin('html').tap(args => {
      args[0].title = 'Auto Show';
      return args;
    });
  },
};
