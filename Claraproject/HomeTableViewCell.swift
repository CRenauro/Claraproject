//
//  HomeTableViewCell.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
