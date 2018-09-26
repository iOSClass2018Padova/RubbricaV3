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

class ListPeopleController: UITableViewController {
    
    
    private var listOfPerson : [Person] = []
    
    private var selectedContact : Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListPeopleCell.kIdentifier, for: indexPath) as! ListPeopleCell

        cell.nameProfile.text = listOfPerson[indexPath.row].fullName()
        
        if let imageProfile = listOfPerson[indexPath.row].image {
            cell.imageProfile.image = imageProfile
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = listOfPerson[indexPath.row]
        self.performSegue(withIdentifier: "detailContactSegue", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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
