# UGSwiftMagicBox

## UI相关

### UIView
#### msg [具体文档](./UGSwiftMagicbox/Document/msg.md)

项目中常用弹框，在view的顶部或下部弹出，可根据不同的app设置不同的样式样式

#### alert
```
 /**
 * view上弹框
 */
public func alert(aview:UIView)->()
```
####
### UIButton
### UILable
1:LHCentLable 默认剧中的lab
### UITextFied
1.设置UITextFied的placeholder
```
   /// 设置 placeholder 富文本
    ///
    /// - Parameters:
    ///   - placeholder: 占位符
    ///   - font: 字体
    ///   - color: 颜色
    func setPlaceholder(placeholder: String, font: UIFont?=nil, color: UIColor?=nil) {
```
2.设置最大输入字数
```
ug_maxlength
```
### UICollectionView
### UIColor
1: 返回rgba颜色

2: 返回随机色

3: 颜色 生成图片
### UIFont
### UIImage
1:将image设置透明度后返回 

```
public func imageWithalpha(_ value:CGFloat) -> UIImage {
 ```

2: 异步设置任意弧度高性能圆角图片
```
func cornerImage(size:CGSize, radius:CGFloat, fillColor: UIColor, completion:@escaping ((_ image: UIImage)->())) -> Void {
```
### UIViewcontrooler
### UITabBarViewcontrooler
一个中间按钮凸起的tabbar
### UINavigationController
```
    /**
     * 设置导航栏颜色 默认透明
     */
    public func ug_navigationBar(backgroundImage:UIImage=UIImage(), shadowImage:UIImage=UIImage()) 
```
## 
### String

## 常用功能

### 突出的tabbar

<img src="./UGSwiftMagicbox/Document/img/tabbar.jpg" width = 320/>

### pageView

<img src="./UGSwiftMagicbox/Document/img/pageView.jpg" width = 320 />

### 启动广告

<img src="./UGSwiftMagicbox/Document/img/launch.jpg" width = 320 />
<img src="./UGSwiftMagicbox/Document/img/launchvideo.jpg" width = 320 />