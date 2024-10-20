const { environment } = require('@rails/webpacker')



// 确保这里的路径指向正确的文件
environment.entry('application', './app/javascript/packs/application');
module.exports = environment
