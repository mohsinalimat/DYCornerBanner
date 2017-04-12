//
//  ViewController.swift
//  DYCornerBannerDemo
//
//  Created by Dominik Butz on 11.04.17.
//  Copyright © 2017 Duoyun. All rights reserved.
//

import UIKit
import DYCornerBanner

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cornerBannerBottomRight: DYCornerBanner!
    
    @IBOutlet weak var cornerBannerTopLeft: DYCornerBanner!
    
    @IBOutlet weak var cornerBannerBottomLeft: DYCornerBanner!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
  self.cornerBannerBottomRight.textFont = UIFont(name: "AmericanTypewriter-Bold", size: 11.0)!
        self.cornerBannerBottomRight.setup(text: "Top Cruise Tour!", textColor: UIColor.white, bannerColor: UIColor.red, position: .bottomRight)
        
        

        self.cornerBannerTopLeft.textFont = UIFont(name: "ChalkboardSE-Bold" , size: 15.0)!
        self.cornerBannerTopLeft.bannerWidth = 17.0
        self.cornerBannerTopLeft.setup(text: "Just Added!", textColor: UIColor.white, bannerColor: UIColor.grassGreen(), position: .topLeft)

       
        
        self.cornerBannerBottomLeft.setup(text: "Sunshine Guaranteed!", textColor: UIColor.black, bannerColor: UIColor.yellow, position: .bottomLeft)
        
        
        let frame = CGRect(x: self.imageView.frame.size.width -  90, y: 0, width: 90, height: 90)
        let bannerInCode = DYCornerBanner(frame: frame)
       bannerInCode.textFont = UIFont(name: "HelveticaNeue-Bold", size: 10.0)!
        bannerInCode.setup(text: "Free Cocktails!", textColor: UIColor.red, bannerColor: UIColor.white.withAlphaComponent(0.6), position: .topRight)
        self.imageView.addSubview(bannerInCode)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


public extension UIColor {
    
    class  func veryDarkGray()->UIColor {
        
        return UIColor(red: 64/255, green: 64/255, blue: 65/255, alpha: 1.0)
    }
    
    class func veryLightGray()->UIColor {
        
        return UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1.0)
    }
    
    
    
    class func dirtyWhite()->UIColor {
        
        return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    }
    
    class func grassGreen()->UIColor {
        return UIColor(red: 39/255, green: 161/255, blue: 60/255, alpha: 1.0)
    }
    
    
    
    
}

