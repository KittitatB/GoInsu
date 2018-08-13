//
//  InsuranceCell.swift
//  GoInsu
//
//  Created by MuMhu on 11/8/2561 BE.
//  Copyright © 2561 Kittitat Boonkarn. All rights reserved.
//

import UIKit

class InsuranceCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var icu: UILabel!
    @IBOutlet weak var accident: UILabel!
    @IBOutlet weak var opd: UILabel!
    @IBOutlet weak var surgr: UILabel!
    @IBOutlet weak var hospital: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
