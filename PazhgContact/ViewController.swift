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

    
    @IBOutlet weak var buttonAuthorization: UIButton!
    @IBOutlet weak var buttonAddSimpleContact: UIButton!
    @IBOutlet weak var buttonAddComplexContact: UIButton!
    
    @IBOutlet weak var textviewStatus: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AddAttribute(To: buttonAuthorization )
        AddAttribute(To: buttonAddSimpleContact)
        AddAttribute(To: buttonAddComplexContact)
        
        AddAttribute(To: textviewStatus)
    }
    
    // MARK: - Design Button
    func AddAttribute ( To Object : AnyObject ) {
        Object.layer.cornerRadius = 5
        Object.layer.borderWidth = 1
        Object.layer.borderColor = UIColor.black.cgColor
        
        if Object is UITextView {
            Object.layer?.borderColor = UIColor.red.cgColor
        }
    }
    
    // MARK: - Buttons
    
    @IBAction func buttonAuthorization(_ sender: UIButton) {
        //Fetching - I/O Contacts
        let store = CNContactStore ()
        textviewStatus.text?.append ("\n \(CNContactStore.authorizationStatus(for: .contacts))")
        store.requestAccess(for: CNEntityType.contacts) { (granted :Bool, error :
            Error?) in
            if let error = error {
                self.textviewStatus.text.append("\n Error \(error)")
            } else {
                if granted {
                   self.textviewStatus.text.append("The Permission has been granted to access the Contacts!")
                    sender.isEnabled = false
                    self.ActiveButtons(with: true )
                } else {
                    self.textviewStatus.text.append("The Permission has not been granted to access the Contacts!")
                    sender.isEnabled = true
                    self.ActiveButtons(with: false )
                } // end of granted else
            } // end of error else
        } // end of storeRequestAccess
    } // end of buttonAuthorization
    
    func ActiveButtons (with : Bool) {
        buttonAddSimpleContact.isEnabled = with
        buttonAddComplexContact.isEnabled = with
    }
    
    @IBAction func buttonAddSimpleContact(_ sender: UIButton) {
    }
    
    @IBAction func buttonAddComplexContact(_ sender: UIButton) {
    }
    
}

