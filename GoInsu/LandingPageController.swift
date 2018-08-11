//
//  LandingPageController.swift
//  GoInsu
//
//  Created by MuMhu on 10/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class LandingPageController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.alpha = 0
        let backgroundImage = #imageLiteral(resourceName: "bg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 1
        self.view.insertSubview(backgroundImageView, at: 0)
        menuView.layer.cornerRadius = 8.0
        menuView.clipsToBounds = true
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        menuView.layer.shadowOpacity = 0.2
        menuView.layer.shadowRadius = 4.0
        findButton.layer.cornerRadius = 6.0
        findButton.clipsToBounds = true
        menuView.alpha = 1
        
    }


}
