//
//  DYCornerBannerTests.swift
//  DYCornerBannerTests
//
//  Created by Dominik Butz on 11.04.17.
//  Copyright © 2017 Duoyun. All rights reserved.
//

import XCTest
import UIKit

@testable import DYCornerBanner

class DYCornerBannerTests: XCTestCase {
    
    var imageView:UIImageView?
    var cornerBannerBottomRight : DYCornerBanner?
    
    override func setUp() {
        super.setUp()
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
            
        self.cornerBannerBottomRight = DYCornerBanner(frame: CGRect(x: 240, y: 110, width: 160, height: 90))
                
    self.imageView?.image = UIImage(named:"IMG_0002.jpg")
        self.imageView?.addSubview(self.cornerBannerBottomRight!)
      
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        self.imageView = nil
        self.cornerBannerBottomRight = nil
  
    }
    
    func testCornerBannerBottomRight() {
        
   
        
        self.cornerBannerBottomRight?.textFont = UIFont(name: "AmericanTypewriter-Bold", size: 11.0)!
        self.cornerBannerBottomRight?.bannerWidth = 17.0
        self.cornerBannerBottomRight?.setup(text: "Top Cruise Tour!", textColor: UIColor.white, bannerColor: UIColor.red, position: .bottomRight)
        
        XCTAssert(self.cornerBannerBottomRight?.bannerPosition == .bottomRight, "corner banner is wrong")
        XCTAssertEqual(self.cornerBannerBottomRight?.bannerLabel.font.familyName, "American Typewriter", "wrong font name!")
        XCTAssertEqual(self.cornerBannerBottomRight?.bannerWidth, 17.0, "Banner width value not correct")
           XCTAssertEqual(self.cornerBannerBottomRight?.bannerLabel.text, "Top Cruise Tour!", "Banner label text incorrect!")
           XCTAssertEqual(self.cornerBannerBottomRight?.bannerLabel.textColor, UIColor.white, "Banner label text color value not correct")
        XCTAssertEqual(self.cornerBannerBottomRight?.bannerLabel.backgroundColor, UIColor.red, "Banner label background color value not correct")

        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
