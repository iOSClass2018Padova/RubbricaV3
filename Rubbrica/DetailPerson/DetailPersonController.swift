//
//  DetailPersonController.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 25/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

protocol DetailPersonEditDelegate: class {
    func editedPerson(person: Person)
}

class DetailPersonController: UIViewController {
    
    private let PERSON_INFO = 0
    private let PERSON_ADDRESS = 1
    private let PERSON_EMAIL = 2
    private let PERSON_REMOVE = 3
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var editingBarButtonItem: UIBarButtonItem!
    
    private var pickerController:UIImagePickerController?
    
    var person : Person = Person()
    weak var delegate : ListPeopleDelegate?
    
    var editingProfile : Bool = false
    private var editedPerson: Person?
    
    private lazy var addingNewElement : Bool = false
    
    private var cancelBarButtonItem : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        
        editingBarButtonItem.title = editingProfile ? "Add" : "Edit"
        addingNewElement = editingProfile
        
        editedPerson?.changeData(person : person)
        
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        
        if editingProfile {
            
            person.changeData(person : editedPerson ?? Person())
            
            guard (person.name != nil && !person.name!.isEmpty) || (person.surname != nil && !person.surname!.isEmpty) else {
                
                let alert = UIAlertController(title: "Attenzione", message: "O il Nome o il Cognome sono obbligatori", preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
                
                return }
            
            if addingNewElement {
                delegate?.addPerson(person: person)
            } else {
                delegate?.reloadContactCell()
            }
            
            if addingNewElement {
                navigationController?.popViewController(animated: true)
            }
        }
        
        dismissEditing()
        
    }
    
    @IBAction func removeAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Rimuovi Contatto", message: "Sei sicuro di rimuovere questo contatto?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let okay = UIAlertAction(title: "Si", style: .default) { (alert) in
            self.delegate?.removePerson(person: self.person)
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okay)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func cancelAction(_ sender: UIBarButtonItem) {
        dismissEditing()
    }
    
    func dismissEditing() {
        editingProfile = !editingProfile
        
        editingBarButtonItem.title = editingProfile ? "Save" : "Edit"
        
        self.navigationItem.leftBarButtonItem = editingProfile ? cancelBarButtonItem : nil
        
        tableView.reloadData()
    }
    
    @IBAction func addPictureProfile(_ sender: UIButton) {
        
        self.pickerController = UIImagePickerController()
        self.pickerController!.delegate = self
        self.pickerController!.allowsEditing = true
        
        let alert = UIAlertController(title: nil, message: "Foto profilo", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Annulla", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        #if !targetEnvironment(simulator)
        let photo = UIAlertAction(title: "Scatta foto", style: .default) { action in
            self.pickerController!.sourceType = .camera
            self.present(self.pickerController!, animated: true, completion: nil)
        }
        alert.addAction(photo)
        #endif
        
        let camera = UIAlertAction(title: "Carica foto", style: .default) { alert in
            self.pickerController!.sourceType = .photoLibrary
            self.present(self.pickerController!, animated: true, completion: nil)
        }
        alert.addAction(camera)
        
        present(alert, animated: true, completion: nil)
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

extension DetailPersonController: DetailPersonEditDelegate {
    
    func editedPerson(person: Person) {
        editedPerson?.changeData(person : person)
    }
    
    
}

extension DetailPersonController : UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !addingNewElement && editingProfile {
            return 4
        }
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case PERSON_INFO:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPersonInfoCell.kIdentifier, for: indexPath) as! DetailPersonInfoCell
            
            cell.delegate = self
            cell.setup(withObject: person, withEditingMode: editingProfile)
            
            return cell
        case PERSON_ADDRESS:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPersonAddressCell.kIdentifier, for: indexPath) as! DetailPersonAddressCell
            
            cell.delegate = self
            cell.setup(withObject: person, withEditingMode: editingProfile)
            
            return cell
        case PERSON_EMAIL:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPersonEmailCell.kIdentifier, for: indexPath) as! DetailPersonEmailCell
            
            cell.delegate = self
            cell.setup(withObject: person, withEditingMode: editingProfile)
            
            return cell
        case PERSON_REMOVE:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailPersonRemoveCell.kIdentifier, for: indexPath) as! DetailPersonRemoveCell
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case PERSON_INFO:
            return 140
        case PERSON_ADDRESS:
            return 98
        case PERSON_EMAIL:
            return 84
        case PERSON_REMOVE:
            return 70
        default:
            return 0
        }
    }
}

// MARK: - ImagePicker Delegate
extension DetailPersonController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    per xcode 9 (vecchio)
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
//            return
//        }
//
//        person.image = image
//        tableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .automatic)
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {
            debugPrint("No image found")
            return
        }
        
        let imageSize: Int = image.pngData()!.count
        let imageDimension = Double(imageSize) / 1024.0 / 1024.0
        print("size of image in MB: %f ", imageDimension)
        
        var img = image
        
        if imageDimension > 15 {
            let percent = (100 * imageDimension) / 15 - 100
            img = image.resized(withPercentage: CGFloat(percent/100)) ?? UIImage()
            
            let imageSize: Int = img.pngData()!.count
            let imageDimension = Double(imageSize) / 1024.0 / 1024.0
            print("size of image in MB: %f ", imageDimension)
            
        }
        
        person.changeData(image: img.pngData())
        tableView.reloadRows(at: [IndexPath(item: 0, section: 0)], with: .automatic)
        self.dismiss(animated: true, completion: nil)
    }
}
