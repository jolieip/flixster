//
//  movieCell.swift
//  flixster
//
//  Created by Jolie Ip Ying See on 22/09/2020.
//  Copyright © 2020 ecotegrity. All rights reserved.
//

import UIKit

class movieCell: UITableViewCell {
    

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sypnosisLabel: UILabel!
    @IBOutlet var posterView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
