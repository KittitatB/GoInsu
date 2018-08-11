//
//  LandingPageController.swift
//  GoInsu
//
//  Created by MuMhu on 10/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit
import DropDown

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LandingPageController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var sexField: UIButton!
    
    let textField = UITextField()
    let chooseSexDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseSexDropDown
        ]
    }()
    
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
        ageField.isUserInteractionEnabled = true
        sexField.backgroundColor = .clear
        sexField.layer.cornerRadius = 6.0
        sexField.layer.borderWidth = 1
        sexField.layer.borderColor = UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 0.7).cgColor
        menuView.alpha = 1
        setupDropDown()
        view.addSubview(textField)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func sexDropDownTapped(_ sender: Any) {
        chooseSexDropDown.show()
    }

    func setupDropDown() {
        DropDown.setupDefaultAppearance()
        
        dropDowns.forEach {
            $0.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
            $0.customCellConfiguration = nil
        }
        
        chooseSexDropDown.anchorView = sexField
        chooseSexDropDown.bottomOffset = CGPoint(x: 0, y: sexField.bounds.height)

        // You can also use localizationKeysDataSource instead. Check the docs.
        chooseSexDropDown.dataSource = [
            "ชาย","หญิง"
        ]

        // Action triggered on selection
        chooseSexDropDown.selectionAction = { [weak self] (index, item) in
            self?.sexField.setTitle(item, for: .normal)
        }
    
    }
}

