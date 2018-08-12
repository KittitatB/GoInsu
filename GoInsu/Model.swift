//
//  Model.swift
//  GoInsu
//
//  Created by MuMhu on 11/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class Insurance: NSObject {
    var name: String?
    var image: String?
    
}

class Userfilter: NSObject {
    var age: Int?
    var isMale: Bool?
    var protection: String?
    var min: Int = 10000
    var max: Int = 90000
    
    func containNull() -> Bool {
        if age != nil{
            if self.isMale != nil{
                if self.protection != nil{
                    if self.min != nil{
                        if self.max != nil{
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    func getImage() -> UIImage {
        switch (self.isMale, self.age as! Int) {
        case (true, 0...20):
            return #imageLiteral(resourceName: "man-kid")
        case (true, 21...50):
            return #imageLiteral(resourceName: "man-ad")
        case (true, 51...1000):
            return #imageLiteral(resourceName: "man-old")
        case (false, 0...20):
            return #imageLiteral(resourceName: "woman-kid")
        case (false, 21...50):
            return #imageLiteral(resourceName: "woman-ad")
        case (false, 51...1000):
            return #imageLiteral(resourceName: "woman-old")
        default:
            print("Wrong switch case")
            return #imageLiteral(resourceName: "logo")
        }
    }
}
