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
