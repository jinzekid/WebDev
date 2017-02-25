cordova.define("cordova-plugin-fg-filewrite.FGFileWriter", function(require, exports, module) {
var exec = require('cordova/exec');

//exports.coolMethod = function(arg0, success, error) {
//    exec(success, error, "FGFileWriter", "coolMethod", [arg0]);
//};

////写法二
var fgFileWirter = {
  coolMethod: function(arg0, success, error) {
    exec(success, error, "FGFileWriter", "coolMethod", [arg0]);
  },
  cordovaGetFileContents: function(arg0, success, error) {
    exec(success, error, "FGFileWriter", "cordovaGetFileContents", [arg0]);
  },
  cordovaSetFileContents: function(arg0, success, error) {
    exec(success, error, "FGFileWriter", "cordovaSetFileContents", [arg0]);
  },
};

module.exports =  fgFileWirter;

});
