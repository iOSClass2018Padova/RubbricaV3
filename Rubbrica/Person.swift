//
//  Person.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 24/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var image : UIImage?
    
    var name : String!
    var surname : String!
    var nikname : String?
    
    var address : String?
    var cap : String?
    var city : String?
    var country : String?
    
    var mobile : String!
    var email : String?
    
    init(name : String, surname: String, mobile: String, image: UIImage? = nil, nikname: String? = nil, address: String? = nil, cap: String? = nil, city: String? = nil, country: String? = nil, email: String? = nil) {
        super.init()
        
        self.name = name
        self.surname = surname
        self.mobile = mobile
        
        self.image = image
        self.nikname = nikname
        
        self.address = address
        self.cap = cap
        self.city = city
        self.country = country
        
        self.email = email
        
        
    }
    
    func fullName() -> String {
        return name + " " + surname
    }

}
