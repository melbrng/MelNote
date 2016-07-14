//
//  NoteListViewController.swift
//  MelNote
//
//  Created by Melissa Boring on 7/14/16.
//  Copyright © 2016 melbo. All rights reserved.
//

import UIKit

class NoteListViewController: UITableViewController {
    
    //for iCloud key-value store we use NSUbiquitousKeyValueStore class for reading and writing property data
    let defaultValueStore = NSUbiquitousKeyValueStore.defaultStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        //Observer to catch changes from iCloud
        let defaultCenter = NSNotificationCenter()
        defaultCenter.addObserver(self, selector: #selector(storeDidChange), name: NSUbiquitousKeyValueStoreChangedKeysKey, object: defaultValueStore)
        
        //Observer to catch local changes

        
        
        
        
    }
    
    
    //array of values of AnyObject type
    func loadNotes() -> AnyObject{
        
        let someNotes: [AnyObject] = defaultValueStore.arrayForKey("NOTES")!
        
        return someNotes
    }
    

    func storeDidChange(){
        
    }

}
