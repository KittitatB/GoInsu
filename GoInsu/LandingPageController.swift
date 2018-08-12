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
    @IBOutlet weak var protectionField: UIButton!
    @IBOutlet weak var minField: UIButton!
    @IBOutlet weak var maxField: UIButton!
    
    let textField = UITextField()
    let chooseSexDropDown = DropDown()
    let chooseProtectionDropDown = DropDown()
    let chooseMinDropDown = DropDown()
    let chooseMaxDropDown = DropDown()
    var userFilter = Userfilter()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseSexDropDown,
            self.chooseProtectionDropDown,
            self.chooseMinDropDown,
            self.chooseMaxDropDown
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDropDown()
        view.addSubview(textField)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func sexDropDownTapped(_ sender: Any) {
        chooseSexDropDown.show()
    }
    
    @IBAction func protectionDropDownTapped(_ sender: Any) {
        chooseProtectionDropDown.show()
    }
    
    @IBAction func maxDropDownTapped(_ sender: Any) {
        chooseMaxDropDown.show()
    }
    
    @IBAction func minDropDownTapped(_ sender: Any) {
        chooseMinDropDown.show()
    }
    
    func setupView(){
        let systemGrey = UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 0.6).cgColor
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
        ageField.backgroundColor = .clear
        ageField.layer.cornerRadius = 6.0
        ageField.layer.borderWidth = 1
        ageField.layer.borderColor = systemGrey
        
        sexField.backgroundColor = .clear
        sexField.layer.cornerRadius = 6.0
        sexField.layer.borderWidth = 1
        sexField.layer.borderColor = systemGrey
        
        protectionField.backgroundColor = .clear
        protectionField.layer.cornerRadius = 6.0
        protectionField.layer.borderWidth = 1
        protectionField.layer.borderColor = systemGrey
        
        minField.backgroundColor = .clear
        minField.layer.cornerRadius = 6.0
        minField.layer.borderWidth = 1
        minField.layer.borderColor = systemGrey
        
        maxField.backgroundColor = .clear
        maxField.layer.cornerRadius = 6.0
        maxField.layer.borderWidth = 1
        maxField.layer.borderColor = systemGrey
        menuView.alpha = 1
    }
    
    func setupDropDown() {
        DropDown.setupDefaultAppearance()
        
        dropDowns.forEach {
            $0.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
            $0.customCellConfiguration = nil
        }
        
        chooseSexDropDown.anchorView = sexField
        chooseProtectionDropDown.anchorView = protectionField
        chooseMinDropDown.anchorView = minField
        chooseMaxDropDown.anchorView = maxField
        
        chooseSexDropDown.bottomOffset = CGPoint(x: 0, y: sexField.bounds.height)
        chooseProtectionDropDown.bottomOffset = CGPoint(x: 0, y: protectionField.bounds.height)
        chooseMinDropDown.bottomOffset = CGPoint(x: 0, y: minField.bounds.height)
        chooseMaxDropDown.bottomOffset = CGPoint(x: 0, y: maxField.bounds.height)
        
        chooseSexDropDown.dataSource = [
            "ชาย","หญิง"
        ]
        
        chooseProtectionDropDown.dataSource = [
            "มี","ไม่มี"
        ]
        
        chooseMinDropDown.dataSource = [
            "10,000","20,000","30,000","40,000","50,000","60,000","70,000","80,000","90,000"
        ]
        
        chooseMaxDropDown.dataSource = [
            "10,000","20,000","30,000","40,000","50,000","60,000","70,000","80,000","90,000"
        ]
        
        chooseSexDropDown.selectionAction = { [weak self] (index, item) in
            if item == "ชาย"{
                self?.userFilter.isMale = true
            }
            else{
                self?.userFilter.isMale = false
            }
            self?.sexField.setTitle(" "+item, for: .normal)
        }
        
        chooseProtectionDropDown.selectionAction = { [weak self] (index, item) in
            self?.userFilter.protection = item
            self?.protectionField.setTitle(" "+item, for: .normal)
        }
        
        chooseMinDropDown.selectionAction = { [weak self] (index, item) in
            let min = item.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
            self?.userFilter.min = Int(min)!
            self?.minField.setTitle(" "+item, for: .normal)
        }
        
        chooseMaxDropDown.selectionAction = { [weak self] (index, item) in
            let max = item.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
            self?.userFilter.min = Int(max)!
            self?.maxField.setTitle(" "+item, for: .normal)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findInsurance" {
            let targetController = segue.destination as! GoInsuPage
            targetController.userFilter = self.userFilter
        }
    }
    
    @IBAction func findDidTapped(_ sender: Any) {
        self.userFilter.age = Int(self.ageField.text!)
        if self.userFilter.age != nil{
            if self.userFilter.isMale != nil{
                if self.userFilter.protection != nil{
                    performSegue(withIdentifier: "findInsurance", sender: self.userFilter)
                    return
                }
            }
        }
        let alert = UIAlertController(title: "ไม่สามารถดำเนินการได้", message: "กรุณากรอกข้อมูลให้ถูกต้อง", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ยอมรับ", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

