//
//  GoInsuPage.swift
//  GoInsu
//
//  Created by MuMhu on 11/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit
import Firebase

class InsuView: UIView{
    override func layoutSubviews() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}

class GoInsuPage: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var insurances = [Insurance]()
    var userFilter = Userfilter()
    var sendedInsurance = Insurance()
    
    @IBOutlet weak var abc: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "ประกันที่เหมาะกันคุณ"
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        abc.image = userFilter.getImage()
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (insurances.count > 5) ? 5:insurances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsuCell", for: indexPath) as! InsuranceCell
        let insurance = insurances[indexPath.row]
        cell.title.text = insurance.name
        cell.logo.image = UIImage(named: insurance.image!)
        cell.hospital.text = insurance.hospital
        cell.accident.text = insurance.accident
        cell.icu.text = insurance.icu
        cell.max.text = insurance.max
        cell.opd.text = insurance.opd
        cell.room.text = insurance.room
        cell.surgr.text = insurance.surgical
        cell.price.text = insurance.price
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 425
    }
    
    func loadData(){
        insurances.removeAll()
        Database.database().reference().child("insurance").observeSingleEvent(of: .value, with: {
            (DataSnapshot) in
            if let insurancesDictionary = DataSnapshot.value as? [String: AnyObject]{
                for insuranceDic in insurancesDictionary{
                    var pricer: Int?
                    let insurance = Insurance()
                    insurance.accident = (insuranceDic.value["accident"]) as! String
                    insurance.hospital = (insuranceDic.value["hospital"]) as! String
                    insurance.icu = (insuranceDic.value["icu"]) as! String
                    insurance.image = (insuranceDic.value["image"]) as! String
                    insurance.max = (insuranceDic.value["max"]) as! String
                    insurance.name = (insuranceDic.value["name"]) as! String
                    insurance.opd = (insuranceDic.value["opd"]) as! String
                    insurance.price = (insuranceDic.value["price"]) as! String
                    insurance.room = (insuranceDic.value["room"]) as! String
                    insurance.surgical = (insuranceDic.value["surgical"]) as! String
                    pricer = Int((insurance.price?.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil))!)
                    if pricer! >= self.userFilter.min && pricer! <= self.userFilter.max{
                        self.insurances.append(insurance)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Back"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendedInsurance = insurances[indexPath.row]
        performSegue(withIdentifier: "apply1", sender: self.sendedInsurance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "apply1" {
            let targetController = segue.destination as! ApplyPage
            targetController.insurance = self.sendedInsurance
        }
    }
    
    
    func filterInsurance(){
        for insurance in insurances{
            insurances.append(insurance)
        }
    }

}
