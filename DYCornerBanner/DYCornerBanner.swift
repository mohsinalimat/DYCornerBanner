//
//  DYCornerBanner.swift
//  Flat Chat
//
//  Created by Dominik Butz on 10.04.17.
//  Copyright © 2017 Duoyun. All rights reserved.
//

import UIKit

public class DYCornerBanner: UIView {

    var bannerLabel:UILabel = UILabel()
    
    var bannerPosition: BannerPosition = .bottomRight
   
    
    fileprivate let configuration = Configuration()
    
    open var textFont: UIFont {
        get {
            return self.configuration.textFont
        }
        set(font) {
            self.configuration.textFont = font
        }
    }
    
    open var bannerWidth: CGFloat {
        get {
            return self.configuration.bannerWidth
        }
        set(width) {
            self.configuration.bannerWidth = width
        }
    }

    

    
    // This method gets called if you create the view in the Interface Builder
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        print("init decoder")
            //self.checkSquareShape()
        
  
    }
    
    // This method gets called if you create the view in code
  public  override init(frame: CGRect){
        super.init(frame: frame)
    print("init in code with frame")
         //  self.checkSquareShape()

    }
    
    /// setup - Has to be called on corner banner instance after creating the instance either in code or in the storyboard
    ///
    /// - Parameters:
    ///   - text: Banner label text.
    ///   - textColor: text color.
    ///   - bannerColor: fill colour of the banner label.
    ///   - position: .bottomRight, .topRight, .topLeft or .bottomLeft
    public func setup(text: String, textColor: UIColor, bannerColor: UIColor, position:BannerPosition ) {
        print("setup called")
     
        // self
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true

          self.bannerPosition = position

        // dummy label for size calculation
        let sizeAdjustmentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 4.0))
        sizeAdjustmentLabel.text = text
        sizeAdjustmentLabel.font = UIFont.systemFont(ofSize: self.bannerWidth)
        sizeAdjustmentLabel.sizeToFit()
//
        // banner size
    //    let labelWidth =  sqrt( pow(self.frame.width, 2) self.frame.width * self.frame.width  + self.frame.height * self.frame.height)
        let labelWidth =  sqrt( pow(self.frame.width, 2) +  pow(self.frame.height, 2))
        
        
        print("label width \(labelWidth)" )
        let labelHeight = sizeAdjustmentLabel.frame.size.height
            print("label height \(labelHeight)" )
        let labelFrame = CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight)
        
        self.bannerLabel = UILabel(frame: labelFrame)
        print("\(self.bannerLabel.frame.width), height \(self.bannerLabel.frame.size.height) ")
//        
//        // banner config
        self.bannerLabel.text = text
        self.bannerLabel.textAlignment = .center
        self.bannerLabel.baselineAdjustment = .alignCenters
        self.bannerLabel.font = self.textFont
        self.bannerLabel.textColor = textColor
        self.bannerLabel.numberOfLines = 1
        self.bannerLabel.lineBreakMode = .byTruncatingTail
        self.bannerLabel.backgroundColor = bannerColor
    
        // banner positioning
        var xAdjustment: CGFloat
        var yAdjustment: CGFloat
        let halfLabelHeight: CGFloat  = labelHeight / 2.0
        
        switch self.bannerPosition  {
        case .bottomRight:
            xAdjustment = halfLabelHeight
            yAdjustment = halfLabelHeight
        case .topRight:
            xAdjustment = halfLabelHeight
            yAdjustment = -halfLabelHeight
        case .bottomLeft:
            xAdjustment = -halfLabelHeight
            yAdjustment = halfLabelHeight
        case .topLeft:
            xAdjustment = -halfLabelHeight
            yAdjustment = -halfLabelHeight
            
        }
        
        self.bannerLabel.center = CGPoint(x: self.frame.width / 2.0 + xAdjustment, y: self.frame.height / 2.0 + yAdjustment)
   
        print("label \(self.bannerLabel)")
        self.addSubview(self.bannerLabel)
        
        
       
    }
    
    override public func layoutSubviews() {
             super.layoutSubviews()
        print("layout subviews called")

        let sinRotationAngle = self.frame.size.height / self.bannerLabel.frame.size.width
        let arcRotation = asin(sinRotationAngle)
        print("arc rotation \(arcRotation)")
        //
        let rotationAngleFactor = { () -> CGFloat in
            switch self.bannerPosition {
            case .bottomRight, .topLeft:
                return -1.0
            case .bottomLeft, .topRight:
                return 1.0
            }
        }()

        let rotation = CGAffineTransform.init(rotationAngle: CGFloat(rotationAngleFactor * arcRotation))
        
        self.bannerLabel.transform = rotation
        
   

    }
    


}



/// an enum for setting the corner banner position
///
/// - bottomRight:  surprise! bottomRight corner.
/// - topRight: topRight
/// - topLeft: yes, you guessed it: top left corner!
/// - bottomLeft: wow, this one, too!
public enum BannerPosition {
    case bottomRight, topRight, topLeft, bottomLeft
}



fileprivate class Configuration {
    
    var textFont: UIFont!
    var bannerWidth: CGFloat!
    
    init() {
       self.setupDefaults()
    }
    
    /// defaults for bannerWidth and text font. The properties in the corner label instance can be overridden.
    func setupDefaults() {
        
        self.bannerWidth = 12.0
        self.textFont = UIFont(name: "HelveticaNeue-Medium", size: 10.0)
        
    }
    
    
}
