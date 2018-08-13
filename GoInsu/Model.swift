//
//  Model.swift
//  GoInsu
//
//  Created by MuMhu on 11/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class Insurance: NSObject {
    var accident: String?
    var hospital: String?
    var icu: String?
    var image: String?
    var max: String?
    var name: String?
    var opd: String?
    var price: String?
    var room: String?
    var surgical: String?
}

class Userfilter: NSObject {
    var age: Int?
    var isMale: Bool?
    var protection: String?
    var min: Int = 10000
    var max: Int = 90000
    
    
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
