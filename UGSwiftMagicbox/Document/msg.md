# msg使用
## 简介
> 项目中常用弹框，在view的顶部或下部弹出，可根据不同的app设置不同的样式样式

如图：

![](./img/info.jpg)
## 使用方法
以下每个方法对应class方法跟实例方法，class方法在window上弹出，实例方法在调用的view上弹出

ug_msginfo("这是一个info弹框")

ug_msgwarning("这是一个error弹框")

ug_msgsuccess("这是一个error弹框")

ug_msgerror("这是一个error弹框")

## 实现方式
实现方式比较简单，就是创建view，添加。具体代码可查看

[UGMessage.swift](../UGSwiftMagicbox/commont/UIView/UGMessage.swift)