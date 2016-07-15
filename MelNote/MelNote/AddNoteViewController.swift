//
//  AddNoteViewController.swift
//  MelNote
//
//  Created by Melissa Boring on 7/14/16.
//  Copyright © 2016 melbo. All rights reserved.
//

import UIKit

class AddNoteViewController: UITableViewController {

     @IBOutlet weak var noteTextField: UITextField!

    
    @IBAction func save(sender: AnyObject) {

        NSNotificationCenter.defaultCenter().postNotificationName("NewNote", object: self, userInfo: ["Note": noteTextField.text!])

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

   
}
