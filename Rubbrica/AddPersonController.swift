//
//  AddPersonController.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 24/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

class AddPersonController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var namePerson: UITextField!
    
    var delegate : ListPeopleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namePerson.delegate = self
        
        namePerson.becomeFirstResponder()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        namePerson.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.addPerson(name: textField.text)
        namePerson.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
