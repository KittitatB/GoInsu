//
//  ApplyPage.swift
//  GoInsu
//
//  Created by MuMhu on 13/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class ApplyPage: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var insuTitle: UILabel!
    @IBOutlet weak var accident: UILabel!
    @IBOutlet weak var opd: UILabel!
    @IBOutlet weak var surgy: UILabel!
    @IBOutlet weak var hospital: UILabel!
    @IBOutlet weak var icu: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var insuPrice: UILabel!
    @IBOutlet weak var insuImage: UIImageView!
    @IBOutlet weak var applyButton: UIButton!
    var insurance = Insurance()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "สมัครเลย"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneField.delegate = self
        nameField.delegate = self
        applyButton.layer.cornerRadius = 6.0
        applyButton.clipsToBounds = true
        insuTitle.text = insurance.name
        accident.text = insurance.accident
        opd.text = insurance.opd
        surgy.text = insurance.surgical
        hospital.text = insurance.hospital
        icu.text = insurance.icu
        room.text = insurance.room
        max.text = insurance.max
        insuPrice.text = insurance.price
        insuImage.image = UIImage(named: insurance.image!)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func handleButton(_ sender: Any) {
        if (nameField.text?.isEmpty)! || (phoneField.text?.isEmpty)! {
            let alert = UIAlertController(title: "ไม่สามารถดำเนินการได้", message: "กรุณากรอกข้อมูลให้ถูกต้อง", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ยอมรับ", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "สำเร็จ", message: "คุณจะได้รับการติดต่อภายใน 24 ชั่วโมง", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.default) { (action) in
                let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
                self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ nameField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }

    

}
