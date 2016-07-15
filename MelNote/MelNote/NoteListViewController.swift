//
//  NoteListViewController.swift
//  MelNote
//
//  Created by Melissa Boring on 7/14/16.
//  Copyright © 2016 melbo. All rights reserved.
//

import UIKit

class NoteListViewController: UITableViewController {
    
    var notes = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        //for iCloud key-value store we use NSUbiquitousKeyValueStore class for reading and writing property data
        let defaultValueStore = NSUbiquitousKeyValueStore.defaultStore()

        
        //Observer to catch changes from iCloud
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(storeDidChange), name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: defaultValueStore)
        
        //obtain a fresh copy of key-value pairs from iCloud
        defaultValueStore.synchronize()
        
        //Observer to catch local or New Note changes
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didAddNewNote), name: "NewNote", object: nil)
    
        loadNotes()
    }
    
    
    //array of values of AnyObject type
    func loadNotes(){
        
        if let someNotes = NSUbiquitousKeyValueStore.defaultStore().arrayForKey("AVAILABLE_NOTES"){
 
            notes = someNotes as NSArray as! [String]
        }
    }
    
    // MARK : TableView Data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
        cell.textLabel!.text = notes[indexPath.row]
        return cell
        
    }
    

    func storeDidChange(notification: NSNotification){
        
        //retrieve changes from iCloud
        loadNotes()
        
        tableView.reloadData()
    }
    
    func didAddNewNote(notification: NSNotification){
        
        
        let userinfo = notification.userInfo
        let noteStr =  userinfo!["Note"] as! String
        notes.append(noteStr)
        
        // Update data in iCloud
        NSUbiquitousKeyValueStore.defaultStore().setArray(notes, forKey: "AVAILABLE_NOTES")
        
        // Reload the table view to show changes
        tableView.reloadData()
        
    }

}
