
# DYCornerBanner

DYCornerBanner written in **Swift 3** allows you to quickly create corner labels on top of any kind of view, e.g. UIImageView. The rotation angle of the corner label is determined by the width and height of the banner view. 

##Features

* set the corner position to bottom right, top right, top left or bottom left.
* supports banners in any rotation angle and distance from the corner - the rotation angle and the distance from the corner are determined by the size and height-width proportion of the DYCornerBanner view's frame. 
* override the default setting for the banner label width. 
* override the default setting for the banner text font.


## Usage

See the following examples.

![DYCornerBanner examples](https://github.com/DominikButz/DYCornerBanner/blob/master/gitResources/cornerBannerExamples.png "Corner banner examples")

###Code example: Creating a DYCornerBanner from Interface Builder

```Swift
 @IBOutlet weak var cornerBannerBottomLeft: DYCornerBanner!  // simply drop a UIView into the VC from interface builder in storyboard  and set the UIView class to DYCornerBanner
 

 override func viewDidLoad() {
   super.viewDidLoad()
   
   self.cornerBannerBottomLeft.setup(text: "Sunshine Guaranteed!", textColor: 	UIColor.black, bannerColor: UIColor.yellow, position: .bottomLeft)
   
 }

```

###Code example: Creating a DYCornerBanner in code

Alternatively, you can create a corner banner instance in code like so: 
```Swift
   let frame = CGRect(x: self.imageView.frame.size.width -  90, y: 0, width: 90, height: 90)
   let bannerInCode = DYCornerBanner(frame: frame)
   bannerInCode.setup(text: "Free Cocktails!", textColor: UIColor.red, bannerColor: UIColor.white.withAlphaComponent(0.6), position: .topRight)
  self.imageView.addSubview(bannerInCode)
```


![DYCornerBanner examples](https://github.com/DominikButz/DYCornerBanner/blob/master/gitResources/cornerBannerExamples.png "Corner banner examples")

### Customising
You can override the settings for bannerWidth and textFont as shown below. Make sure to set these properties **before calling setup**, otherwise the defaults will be set instead. 

```Swift

  self.cornerBannerTopLeft.textFont = UIFont(name: "ChalkboardSE-Bold" , size: 15.0)!
  self.cornerBannerTopLeft.bannerWidth = 17.0
self.cornerBannerTopLeft.setup(text: "Just Added!", textColor: UIColor.white, bannerColor: UIColor.grassGreen(), position: .topLeft)

```

## License

The MIT License (MIT)

Copyright (c) 2017 Dominik Butz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

