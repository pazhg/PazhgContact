//
//  ViewController.swift
//  PazhgContact
//
//  Created by Pazhg on 2/14/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    var mainContactStore : CNContactStore?
    
    @IBOutlet weak var buttonAuthorization: UIButton!
    @IBOutlet weak var buttonAddSimpleContact: UIButton!
    @IBOutlet weak var buttonAddComplexContact: UIButton!
    
    @IBOutlet weak var textviewStatus: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AddAttribute(To: buttonAuthorization, With: UIColor.black )
        AddAttribute(To: buttonAddSimpleContact , With: UIColor.gray)
        AddAttribute(To: buttonAddComplexContact , With: UIColor.gray )

        AddAttribute(To: textviewStatus , With: UIColor.red)
    }
    
    // MARK: - Design Button
    func AddAttribute ( To Object : AnyObject , With Color : UIColor ) {
        Object.layer.cornerRadius = 5
        Object.layer.borderWidth = 1
        Object.layer.borderColor = Color.cgColor
        
        if Object is UITextView {
            Object.layer?.borderColor = Color.cgColor
        }
    }
    
    // MARK: - Buttons
    
    @IBAction func buttonAuthorization(_ sender: UIButton) {

        let contactStore = checkContactStore()
        
        self.textviewStatus.text?.append ("\n\(CNContactStore.authorizationStatus(for: .contacts))")
        self.textviewStatus.text?.append("\(contactStore.2)")
        
        let statusContactStore = contactStore.1
        ActiveButtons(with: statusContactStore)
        
        mainContactStore = contactStore.0
        
    } // end of buttonAuthorization
    
    func checkContactStore () -> ( CNContactStore , Bool , String ) {

        let store = CNContactStore ()
        var status = false
        var string =  ""
        
        store.requestAccess(for: CNEntityType.contacts) { (granted : Bool, error :
            Error?) in
            if let error = error {
               string =  "\n Error \(error)"
            } else {
                if granted {
                    string = "\nThe Permission has been granted to access the Contacts!"
                    status = true
                } else {
                    string = "\nThe Permission has not been granted to access the Contacts!"
                    status =  false
                } // end of granted else
            } // end of error else
        } // end of storeRequestAccess
        return ( store , status , string )
    }
    
    func ActiveButtons (with : Bool) {
        buttonAddSimpleContact.isEnabled = with
        buttonAddComplexContact.isEnabled = with
        buttonAuthorization.isEnabled = !with
        
        if with {
            AddAttribute(To: buttonAuthorization, With: UIColor.gray )
            AddAttribute(To: buttonAddSimpleContact , With: UIColor.black)
            AddAttribute(To: buttonAddComplexContact , With: UIColor.black )
        }
        else {
            AddAttribute(To: buttonAuthorization, With: UIColor.black )
            AddAttribute(To: buttonAddSimpleContact , With: UIColor.gray)
            AddAttribute(To: buttonAddComplexContact , With: UIColor.gray )
        }
    }
    
    @IBAction func buttonAddSimpleContact(_ sender: UIButton) {
        // Creating a mutable object to add to the contact
        
        guard  mainContactStore != nil else {
            self.textviewStatus.text = "\n The ContactStore is empty!"
            return
        }
        
        textviewStatus.text = "Inside -> Create a simple contact..."
       
        let contact = CNMutableContact()
        
        contact.contactType = CNContactType.person
        
        //Personal Information
        contact.givenName = "Kambiz"
        contact.familyName = "Guity"
        contact.middleName = ""
        contact.nickname = ""
        contact.departmentName = "Management"
        contact.jobTitle = "President & Co-Founder"
        contact.organizationName = "Pazhg Company - Native App Development Group"
        contact.note = "This app is a simple app for a person who wants to write code to working on Contacts"
        
        //TODO- : Complete code to insert new item in contact list
        
        
    
    }
    
    @IBAction func buttonAddComplexContact(_ sender: UIButton) {
    }
    
}

