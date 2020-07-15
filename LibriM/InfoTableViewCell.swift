//
//  InfoTableViewCell.swift
//  LibriM
//
//  Created by Flutura Haxhaj on 7/15/20.
//  Copyright © 2020 Endrit Bajrami. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblLibri: UILabel!
    
    @IBOutlet weak var lblAutori: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
