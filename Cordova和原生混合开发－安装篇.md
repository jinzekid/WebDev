方法1:(使用Cordova)
1.创建一个Cordova目录</br>
   $mkdir Cordova
</br></br>
2.进入Cordova目录</br>
   $cd Cordova
</br></br>
3.创建一个cordova目录</br>
   $Cordova cordova create test com.example.hello TestCordova
</br></br>
4.进入到test目录</br>
   $cd test
</br></br>
5.指定生成iOS平台的代码项目</br>
   test$ cordova platforms add ios
</br></br>
6.把如图中的文件夹copy到我们的原生项目中
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/1.png)
</br></br>
7.把2个config.xml文件copy到对应的文件夹
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/2.png)
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/3.png)
</br></br>
8.配置参数
点击①中的按钮创建"New Run Script Phase" ，②为创建的"Run Script"
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/4.png)
</br></br>
9.将中①原名称"Run Script"修改为"Copy www directory"；将②中的选项去掉；将下面的代码复制到③中:
代码如下：
NODEJS_PATH=/usr/local/bin; NVM_NODE_PATH=~/.nvm/versions/node/`nvm version 2>/dev/null`/bin; N_NODE_PATH=`find /usr/local/n/versions/node/* -maxdepth 0 -type d 2>/dev/null | tail -1`/bin; XCODE_NODE_PATH=`xcode-select --print-path`/usr/share/xcs/Node/bin; PATH=$NODEJS_PATH:$NVM_NODE_PATH:$N_NODE_PATH:$XCODE_NODE_PATH:$PATH && node cordova/lib/copy-www-build-step.js
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/5.png)
</br></br>
10.Build Settings -> Other Linker Flags 中添加"-ObjC -all_load"（或者"-ObjC"）
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/6.png)
</br></br>
11.添加CordovaLib.xcodeproj到项目
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/7.png)
</br></br>
12.添加www文件夹和config.xml文件
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/8.png)
</br></br>
13.Schemes按照下图配置，然后编译一次程序，最后导入下面两项
Build Phases -> Target Dependencies -> CordovaLib</br>
Build Phases -> Link Binary With Libraries -> libCordova.a</br>
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/9.png)
</br></br>
14.最后把ViewController.h文件修改如下，编译后就可以运行了。</br>
</br></br>
-------------------------------------我是分割线----------------------------------
</br></br>
方法2:(推荐使用ionic)</br>
1.安装ionic</br>
npm install -g cordova ionic
</br></br>
2.开始一个项目（三种方法）</br>
- $ ionic start --v2 myApp blank</br>
- $ ionic start --v2 myApp tabs</br>
- $ ionic start --v2 myApp sidemenu</br>
</br></br>
3.添加对应平台</br>
ionic platform add $platform</br>
ionic platform add ios</br>
ionic platform add android</br>
</br></br>
4.编译对应平台</br>
ionic build ios</br>
ionic build android</br>
</br></br>
PS:基本方法和Cordova大致一样。如果有新加的插件，需要把plugin文件也一起添加进项目。</br>
![image](https://github.com/jinzekid/ionic-native-hybirdDev/blob/master/src/imgs/10.png)
</br></br>
参考网址：http://www.jianshu.com/p/e982b9a85ae8
</br></br>
参考网址：http://ionicframework.com/getting-started/

