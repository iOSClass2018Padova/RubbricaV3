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

    @IBOutlet var lineViews: [UIView]! {
        didSet {
            lineViews.forEach { (view) in
                view.backgroundColor = .black
            }
        }
    }
    
    @IBOutlet weak var imageProfile: UIButton! {
        didSet {
            imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
            imageProfile.imageView?.contentMode = .scaleAspectFill
            imageProfile.clipsToBounds = true
        }
    }
    @IBOutlet weak var surnameProfile: UITextField!
    @IBOutlet weak var nameProfile: UITextField!
    @IBOutlet weak var niknameProfile: UITextField!
    @IBOutlet weak var mobileProfile: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        surnameProfile.text = object.surname
        nameProfile.text = object.name
        niknameProfile.text = object.nikname
        mobileProfile.text = object.mobile
        
        if let imageProfile = object.image {
            self.imageProfile.setImage(imageProfile, for: .normal)
        }
        
        self.imageProfile.isUserInteractionEnabled = edit
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
    }

}

class DetailPersonAddressCell: UITableViewCell {
    
    static let kIdentifier = "DetailPersonAddressCell"
    
    @IBOutlet var lineViews: [UIView]! {
        didSet {
            lineViews.forEach { (view) in
                view.backgroundColor = .black
            }
        }
    }
    
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
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        addressProfile.text = object.address
        capProfile.text = object.cap
        cityProfile.text = object.city
        countryProfile.text = object.country
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
    }
    
}

class DetailPersonEmailCell: UITableViewCell {
    
    @IBOutlet var lineViews: [UIView]! {
        didSet {
            lineViews.forEach { (view) in
                view.backgroundColor = .black
            }
        }
    }
    
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
    
    func setup(withObject object : Person, withEditingMode edit : Bool) {
        emailProfile.text = object.email
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
    }
    
}
