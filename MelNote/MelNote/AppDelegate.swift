//
//  AppDelegate.swift
//  MelNote
//
//  Created by Melissa Boring on 7/14/16.
//  Copyright © 2016 melbo. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?)
        -> Bool {
            
            //configure a FIRApp shared instance
            FIRApp.configure()
            
            FIRAuth.auth()?.signInWithEmail("testuser@gmail.com", password: "password") { (user, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    } else {
                        print("Successful login")
                    }
                }
  
            return true
        }
    
}

