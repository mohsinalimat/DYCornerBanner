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
            self.checkSquareShape()
        
  
    }
    
    // This method gets called if you create the view in code
  public  override init(frame: CGRect){
        super.init(frame: frame)
    print("init in code with frame")
           self.checkSquareShape()

    }
    



//    
//    public convenience init(frame:CGRect,  text: String, textColor: UIColor, bannerColor: UIColor, position: BannerPosition) {
//      
//        self.init(frame: frame)
//          self.setup(text: text, textColor: textColor, bannerColor: bannerColor, position: position)
//        
//    }
    
    
    
    private func checkSquareShape() {
        
        print("corner banner width \(self.frame.width) , height \(self.frame.height)")
        assert(self.frame.width == self.frame.height, "The corner banner will only be displayed correctly if the view is a square!")
        
    }
    
    

    
    public func setup(text: String, textColor: UIColor, bannerColor: UIColor, position:BannerPosition ) {
        print("setup called")
     
        // self
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
        self.clipsToBounds = true
        
//        
          self.bannerPosition = position

        
        // dummy label for size calculation
        let sizeAdjustmentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 4.0))
        sizeAdjustmentLabel.text = text
        sizeAdjustmentLabel.font = UIFont.systemFont(ofSize: self.bannerWidth)
        sizeAdjustmentLabel.sizeToFit()
//
        // banner size
        let labelWidth =  sqrt( 2.0 * self.frame.width * self.frame.height)
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


        let rotationAngle = { () -> Double in
            switch self.bannerPosition {
            case .bottomRight, .topLeft:
                return -M_PI_4
            case .bottomLeft, .topRight:
                return M_PI_4
            }
        }()
        print("rotation angle: \(rotationAngle)")
        
        let rotation = CGAffineTransform.init(rotationAngle: CGFloat(rotationAngle))
        //
        self.bannerLabel.transform = rotation
        
   

    }
    


}

public enum BannerPosition {
    case bottomRight, topRight, topLeft, bottomLeft
}

fileprivate class Configuration {
    
    var textFont: UIFont!
    var bannerWidth: CGFloat!
    
    init() {
       self.setupDefaults()
    }
    
    func setupDefaults() {
        
        self.bannerWidth = 12.0
        self.textFont = UIFont(name: "HelveticaNeue-Medium", size: 10.0)
        
    }
    
    
}
