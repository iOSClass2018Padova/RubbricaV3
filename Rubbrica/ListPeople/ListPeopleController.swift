//
//  ListPeopleController.swift
//  Rubbrica
//
//  Created by stefano vecchiati on 24/09/2018.
//  Copyright © 2018 co.eggon. All rights reserved.
//

import UIKit

protocol ListPeopleDelegate {
    func addPerson(name: String?)
    func reloadTableView()
}

class ListPeopleController: UIViewController {
    
    
    private var listOfPerson : [Person] = []
    
    private var selectedContact : Person?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                switch segue.identifier {
                case "addPersonSegue":
                    if let destinationController = segue.destination as? AddPersonController {
                        destinationController.delegate = self
                    }
                case "detailContactSegue":
                    if let destinationController = segue.destination as? DetailPersonController, let selectedPerson = selectedContact {
                        destinationController.person = selectedPerson
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
    
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    
    func addPerson(name: String?) {
        if let namePerson = name {
            listOfPerson.append(Person(name: namePerson, surname: "cognome", mobile: "3439824023"))
            tableView.reloadData()
        }
    }
    
    
    
}
