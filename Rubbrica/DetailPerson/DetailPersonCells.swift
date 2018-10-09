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
    
    private var editingPerson : Person!
    
    weak var delegate: DetailPersonEditDelegate?
    
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
        
        editingPerson = Person(value: object)
        
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
            self.imageProfile.setImage(UIImage(data: imageProfile), for: .normal)
        } else {
            self.imageProfile.setImage(UIImage(named: "Placeholder-image"), for: .normal)
        }
        
        self.imageProfile.isUserInteractionEnabled = edit
        
        for lineView in lineViews {
            lineView.isHidden = !edit
        }
        
        for textField in textFields {
            textField.isEnabled = edit
            textField.delegate = edit ? self : nil
        }
        
    }
    @IBAction func editingTextAction(_ sender: UITextField) {
        switch sender.tag {
        case TextFieldType.name.rawValue:
            editingPerson.changeData(name: sender.text)
        case TextFieldType.surname.rawValue:
            editingPerson.changeData(surname : sender.text)
        case TextFieldType.nikname.rawValue:
            editingPerson.changeData(nikname : sender.text)
        case TextFieldType.mobile.rawValue:
            editingPerson.changeData(mobile : sender.text)
        default:
            break
        }
        
        delegate?.editedPerson(person: editingPerson)
        
    }
    
    
}

extension DetailPersonInfoCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

class DetailPersonAddressCell: UITableViewCell {
    
    enum TextFieldType : Int {
        case address = 0
        case cap
        case city
        case country
    }
    
    private var editingPerson : Person!
    
    weak var delegate: DetailPersonEditDelegate?
    
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
        
        editingPerson = Person(value: object)
        
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
            textField.delegate = edit ? self : nil
        }
        
    }
    
    @IBAction func editingTextAction(_ sender: UITextField) {
        switch sender.tag {
        case TextFieldType.address.rawValue:
            editingPerson.changeData(address : sender.text)
        case TextFieldType.cap.rawValue:
            editingPerson.changeData(cap : sender.text)
        case TextFieldType.city.rawValue:
            editingPerson.changeData(city : sender.text)
        case TextFieldType.country.rawValue:
            editingPerson.changeData(country : sender.text)
        default:
            break
        }
        
        delegate?.editedPerson(person: editingPerson)
        
    }
    
}

extension DetailPersonAddressCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

class DetailPersonEmailCell: UITableViewCell {
    
    enum TextFieldType : Int {
        case email = 0
    }
    
    weak var delegate: DetailPersonEditDelegate?
    
    private var editingPerson : Person!
    
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
        
        editingPerson = Person(value: object)
        
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
            textField.delegate = edit ? self : nil
        }
        
    }
    
    @IBAction func editingTextAction(_ sender: UITextField) {
        switch sender.tag {
        case TextFieldType.email.rawValue:
            editingPerson.changeData(email : sender.text)
        default:
            break
        }
        
        delegate?.editedPerson(person: editingPerson)
        
    }
    
}

extension DetailPersonEmailCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

class DetailPersonRemoveCell: UITableViewCell {
    
    static let kIdentifier = "DetailPersonRemoveCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
