//
//  GoInsuPage.swift
//  GoInsu
//
//  Created by MuMhu on 11/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class InsuView: UIView{
    override func layoutSubviews() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}

class GoInsuPage: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var insurances = [Insurance]()
    var userFilter = Userfilter()
    
    @IBOutlet weak var abc: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "ประกันที่เหมาะกันคุณ"
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    

}
