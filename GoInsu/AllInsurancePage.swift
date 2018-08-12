//
//  AllInsurancePage.swift
//  GoInsu
//
//  Created by MuMhu on 12/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class AllInsurancePage: UITableViewController{
    var insurances = [Insurance]()
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "ประกันทั้งหมด"
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var insu1 = Insurance()
        insu1.name = "AAA"
        insu1.image = "TVV"
        var insu2 = Insurance()
        insu2.name = "BBB"
        insu2.image = "LMG"
        var insu3 = Insurance()
        insu3.name = "CCC"
        insu3.image = "PCC"
        insurances.append(insu1)
        insurances.append(insu2)
        insurances.append(insu3)
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
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

}
