### 1.创建插件信息(在customPlugins文件夹中)
    plugman create --name FileWriter --plugin_id cordova-plugin-filewriter --plugin_version 0.0.1
    参数:
    pluginName: 插件名字
    pluginID: 插件id, egg : coolPlugin
    oversion: 版本, egg : 0.0.1
    directory:一个绝对或相对路径的目录，该目录将创建插件项目
    variable NAME=VALUE: 额外的描述，如作者信息和相关描述
    
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/1.png)

### 2.生成对应的原生文件
    进入scr文件夹，新建文件夹ios，退出当前文件夹
    输入命令
    plugman platform add --platform_name ios （在iOS文件中会生成对应文件)
    
    进入scr文件夹，新建文件夹android，退出当前文件夹
    输入命令
    plugman platform add --platform_name android
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/2.png)

### 3.修改对应的原生文件
    在原生文件中添加对应的方法
    比如：（iOS方法）
    - (void) cordovaGetFileContents:(CDVInvokedUrlCommand *)command;
    - (void) cordovaSetFileContents:(CDVInvokedUrlCommand *)command;
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/3.png)

### 4.修改www文件夹下面的.js文件
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/4.png)
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/5.png)

### 5.安装插件
    输入命令:
        cordova plugin add 插件路径(路径下面有plugin.xml)
    ps：删除插件命令
        cordova plugin rm cordova-plugin-filewriter
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/6.png)

### 6.添加对应开发平台(自动添加插件)
    输入命令:
        cordova platforms add ios
        cordova platforms add android
    ps：删除插件命令
        cordova platforms rm ios
    
    
