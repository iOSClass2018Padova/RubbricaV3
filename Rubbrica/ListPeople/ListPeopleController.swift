//
//  ListPeopleController.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 24/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

protocol ListPeopleDelegate {
    func reloadTableView()
    func addPerson(person : Person)
}

class ListPeopleController: UIViewController {
    
    
    private var listOfPerson : [Person] = []
    
    private var selectedContact : Person?
    
    private var addNewPerson : Bool = false

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPersonAction(_ sender: UIBarButtonItem) {
        selectedContact = nil
        addNewPerson = true
        self.performSegue(withIdentifier: "detailContactSegue", sender: self)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                switch segue.identifier {
                case "detailContactSegue":
                    if let destinationController = segue.destination as? DetailPersonController {
                        destinationController.person = selectedContact ?? Person()
                        
                        destinationController.editingProfile = addNewPerson
                        
                        destinationController.delegate = self
                    }
                default:
                    break
                }
        
    }
 

}

extension ListPeopleController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfPerson.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListPeopleCell.kIdentifier, for: indexPath) as! ListPeopleCell
        
        cell.nameProfile.text = listOfPerson[indexPath.row].fullName()
        
        if let imageProfile = listOfPerson[indexPath.row].image {
            cell.imageProfile.image = imageProfile
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = listOfPerson[indexPath.row]
        self.performSegue(withIdentifier: "detailContactSegue", sender: self)
    }
    
}

extension ListPeopleController : ListPeopleDelegate {
    
    
    func addPerson(person : Person) {
        if addNewPerson {
            listOfPerson.append(person)
            addNewPerson = false
        }
    }
    
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    
    
}
