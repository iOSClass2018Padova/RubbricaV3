//
//  DetailPersonCells.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 25/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

class DetailPersonInfoCell: UITableViewCell {
    
    static let kIdentifier = "DetailPersonInfoCell"

    @IBOutlet weak var imageProfile: UIButton! {
        didSet {
            imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
            imageProfile.imageView?.contentMode = .scaleAspectFill
            imageProfile.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameProfile: UITextField!
    @IBOutlet weak var niknameProfile: UITextField!
    @IBOutlet weak var mobbileProfile: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class DetailPersonAddressCell: UITableViewCell {
    
    static let kIdentifier = "DetailPersonAddressCell"
    
    @IBOutlet weak var addressProfile: UITextField!
    @IBOutlet weak var capProfile: UITextField!
    @IBOutlet weak var cityProfile: UITextField!
    @IBOutlet weak var countryProfile: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class DetailPersonEmailCell: UITableViewCell {
    
    static let kIdentifier = "DetailPersonEmailCell"
    
    @IBOutlet weak var emailProfile: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
