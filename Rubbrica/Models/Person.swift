//
//  Person.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 24/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class Person: Object {
    
    dynamic var image : Data?
    
    dynamic var name : String?
    dynamic var surname : String?
    dynamic var nikname : String?
    
    dynamic var address : String?
    dynamic var cap : String?
    dynamic var city : String?
    dynamic var country : String?
    
    dynamic var mobile : String?
    dynamic var email : String?
    
    convenience init(name : String? = nil, surname: String? = nil, mobile: String? = nil, image: Data? = nil, nikname: String? = nil, address: String? = nil, cap: String? = nil, city: String? = nil, country: String? = nil, email: String? = nil) {
        self.init()
        
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
        var fullName = ""
        
        fullName += (self.name != nil) ? self.name! + " " : ""
        fullName += self.surname ?? ""
        
        return fullName
    }
    
    func changeData(in realm: Realm = try! Realm(), name : String? = nil, surname: String? = nil, mobile: String? = nil, image: Data? = nil, nikname: String? = nil, address: String? = nil, cap: String? = nil, city: String? = nil, country: String? = nil, email: String? = nil, person: Person? = nil) {
        do {
            try realm.write {
                
                self.name = name ?? person?.name ?? self.name
                self.surname = surname ?? person?.surname ?? self.surname
                self.mobile = mobile ?? person?.mobile ?? self.mobile
                
                self.image = image ?? person?.image ?? self.image
                self.nikname = nikname ?? person?.nikname ?? self.nikname
                
                self.address = address ?? person?.address ?? self.address
                self.cap = cap ?? person?.cap ?? self.cap
                self.city = city ?? person?.city ?? self.city
                self.country = country ?? person?.country ?? self.country
                
                self.email = email ?? person?.email ?? self.email
                
            }
        }catch {}
        
    }
    
    
    func add(in realm: Realm = try! Realm()) {
        do {
            try realm.write {
                realm.add(self)
            }
        } catch {}
    }
    
    static func all(in realm: Realm = try! Realm()) -> [Person] {
        return Array(realm.objects(Person.self))
    }
    
    func remove(in realm: Realm = try! Realm()) {
        do {
            try realm.write {
                realm.delete(self)
            }
        } catch {}
    }
    
}
