#   iOS篇
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
    输入命令:(进入scr文件夹，新建文件夹ios，退出当前文件夹)
        plugman platform add --platform_name ios （在iOS文件中会生成对应文件)
    输入命令:(进入scr文件夹，新建文件夹android，退出当前文件夹)
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
        cordova platforms rm android
        添加不同android版本
        cordova platforms add android@4.1.1 //添加不同android版本
        
 ![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/7.png)
  ![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/8.png)
  
测试插件(打开platforms/ios文件中的xcode项目）
=============================

### 7.修改index.html文件内容如下：
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/9.png)
### 8.修改js文件夹下面的index.js文件：
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/10.png) 
### 9.在onDeviceReady方法中添加插件方法，如下：
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/11.png) 
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/12.png) 

### 10.最后运行效果：
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/13.png)
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/14.png) 

### 11.android注意事项
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/15.png) 


### 参考网址：
    https://taco.visualstudio.com/en-us/docs/createplugintutorial/
    http://www.jianshu.com/p/d24219c008b6

#   Android篇
### 1.打开原生项目，复制js文件
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/16.png)

### 2.添加已经创建的插件,在src中找到对应的java文件夹，复制到app/java中(把android平台下，src/FGCordovaPlugin文件夹复制到原生app文件夹下面注意在复制java文件时候，一定要在main的package下，要不然会找不到java文件的（不要在test下添加包）)
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/17.png)

### 3.修改Corodova_plugins.js文件，把插件添加进来
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/18.png)

### 4.修改res/xml/config.xml文件（如果没有对应的插件需要删除避免崩溃）
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/19.png)

### 5.测试插件
    5.1修改index.html文件
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/20.png)

    5.2修改js/index.js文件
![image](https://github.com/jinzekid/cordova-native-hybirdDev/blob/master/src/imgs/cordova%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8F%92%E4%BB%B6/21.png)








