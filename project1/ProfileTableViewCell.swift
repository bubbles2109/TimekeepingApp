//
//  ProfileTableViewCell.swift
//  project1
//
//  Created by Phamcuong on 11/11/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbWorkSpace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbUserName.font = UIFont(name: "Abril Fatface", size: 30)
        lbWorkSpace.font = UIFont(name: "Abril Fatface", size: 30)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
