# UGSwiftMagicBox

## UI相关

### UIView
#### msg
项目中常用弹框，在view的顶部或下部谈起，可配置样式。主要方法有：
```
extension UIView {

    /**
     * 类方法 window上弹出info提示，默认在底部
     */
    class open func ug_msginfo(_ text: String,
                            options: [GSMessageOption]? = [.position(.bottom)]){

        let window = UIApplication.shared.keyWindow
        window?.ug_msginfo(text, options: options)
    }
    
    /**
     * 类方法 window上弹出error提示，默认在底部
     */
    class open func ug_msgerror(_ text: String,
                             options: [GSMessageOption]? = [.position(.bottom)]){
        let window = UIApplication.shared.keyWindow
        window?.ug_msgerror(text, options: options)
    }
    
    /**
     * 类方法 window上弹出success提示，默认在底部
     */
    class open func ug_msgsuccess(_ text: String,
                               options: [GSMessageOption]? = [.position(.bottom)]){
        let window = UIApplication.shared.keyWindow
        window?.ug_msgsuccess(text, options: options)
    }

    

    /**
     * view上弹出info提示，默认在底部
     */
    open func ug_msginfo(_ text: String,
                  options: [GSMessageOption]? = [.position(.bottom)]){
        GSMessage.showMessageAddedTo(text: text as String, type: .info, options: options, inView: self, inViewController: nil)
    }
    /**
     * view上弹出error提示，默认在顶
     */
    open func ug_msgerror(_ text: String,
                      options: [GSMessageOption]? = [.position(.top)]){
        GSMessage.showMessageAddedTo(text: text as String, type: .error, options: options, inView: self, inViewController: nil)
    }
    /**
     * view上弹出success提示，默认底
     */
    open func ug_msgsuccess(_ text: String,
                      options: [GSMessageOption]? = [.position(.bottom)]){
        
        GSMessage.showMessageAddedTo(text: text as String, type: .success, options: options, inView: self, inViewController: nil)
    }
```
调用示列
``` 
view.ug_msgerror("这是一条error消息")
```

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