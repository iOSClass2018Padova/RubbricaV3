//
//  DetailPersonCells.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 25/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

class DetailPersonInfoCell: UITableViewCell {
    
    enum TextFieldType : Int {
        case name = 0
        case surname
        case nikname
        case mobile
    }
    
    static let kIdentifier = "DetailPersonInfoCell"
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet var lineViews: [UIView]!
    
    @IBOutlet weak var imageProfile: UIButton! {
        didSet {
            imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
            imageProfile.imageView?.contentMode = .scaleAspectFill
            imageProfile.clipsToBounds = true
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        
        for textField in textFields {
            switch textField.tag {
            case TextFieldType.name.rawValue:
                textField.text = object.name
            case TextFieldType.surname.rawValue:
                textField.text = object.surname
            case TextFieldType.nikname.rawValue:
                textField.text = object.nikname
            case TextFieldType.mobile.rawValue:
                textField.text = object.mobile
            default:
                break
            }
        }
        
        if let imageProfile = object.image {
            self.imageProfile.setImage(imageProfile, for: .normal)
        }
        
        self.imageProfile.isUserInteractionEnabled = edit
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
        for textField in textFields {
            textField.isEnabled = edit
        }
        
    }
    
}

class DetailPersonAddressCell: UITableViewCell {
    
    enum TextFieldType : Int {
        case address = 0
        case cap
        case city
        case country
    }
    
    static let kIdentifier = "DetailPersonAddressCell"
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet var lineViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        
        for textField in textFields {
            switch textField.tag {
            case TextFieldType.address.rawValue:
                textField.text = object.address
            case TextFieldType.cap.rawValue:
                textField.text = object.cap
            case TextFieldType.city.rawValue:
                textField.text = object.city
            case TextFieldType.country.rawValue:
                textField.text = object.country
            default:
                break
            }
        }
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
        for textField in textFields {
            textField.isEnabled = edit
        }
        
    }
    
}

class DetailPersonEmailCell: UITableViewCell {
    
    enum TextFieldType : Int {
        case email = 0
    }
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet var lineViews: [UIView]!
    
    static let kIdentifier = "DetailPersonEmailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        
        for textField in textFields {
            switch textField.tag {
            case TextFieldType.email.rawValue:
                textField.text = object.email
            default:
                break
            }
        }
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
        for textField in textFields {
            textField.isEnabled = edit
        }
        
    }
    
}
