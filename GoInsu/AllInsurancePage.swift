//
//  AllInsurancePage.swift
//  GoInsu
//
//  Created by MuMhu on 12/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit
import Firebase

class AllInsurancePage: UITableViewController{
    var insurances = [Insurance]()
    var sendedInsurance = Insurance()
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "ประกันทั้งหมด"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        navigationItem.backBarButtonItem?.title = "Back"
        tableView.separatorStyle = .none

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return insurances.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsuCell2", for: indexPath) as! InsuranceCell
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
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 425
    }
    
    func loadData(){
        insurances.removeAll()
        Database.database().reference().child("insurance").observeSingleEvent(of: .value, with: {
            (DataSnapshot) in
            if let insurancesDictionary = DataSnapshot.value as? [String: AnyObject]{
                for insuranceDic in insurancesDictionary{
                    let insurance = Insurance()
                    insurance.accident = (insuranceDic.value["accident"]) as! String
                    insurance.hospital = (insuranceDic.value["hospital"]) as! String
                    insurance.icu = (insuranceDic.value["icu"]) as! String
                    insurance.image = (insuranceDic.value["image"]) as! String
                    insurance.max = (insuranceDic.value["max"]) as! String
                    insurance.name = (insuranceDic.value["name"]) as! String
                    insurance.opd = (insuranceDic.value["opd"]) as! String
                    insurance.room = (insuranceDic.value["room"]) as! String
                    insurance.surgical = (insuranceDic.value["surgical"]) as! String
                    insurance.price = (insuranceDic.value["price"]) as! String
                    self.insurances.append(insurance)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendedInsurance = insurances[indexPath.row]
        performSegue(withIdentifier: "apply2", sender: self.sendedInsurance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "apply2" {
            let targetController = segue.destination as! ApplyPage
            targetController.insurance = self.sendedInsurance
        }
    }

}
