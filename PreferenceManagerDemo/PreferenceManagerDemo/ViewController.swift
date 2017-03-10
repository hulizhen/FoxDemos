//
//  ViewController.swift
//  PreferenceManagerDemo
//
//  Created by Lizhen Hu on 10/03/2017.
//  Copyright © 2017 Lizhen Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demo()
    }

    func demo() {
        let userDefaults = UserDefaults.standard
        
        // Test data.
        var launchAtLogin = true
        var launchCount = 10
        var userInfo: UserInfo? = UserInfo(id: 123, name: "Fox")
        
        // Write preference.
        Preferences[.launchAtLogin] = launchAtLogin
        Preferences[.launchCount] = launchCount
        Preferences[.userInfo] = userInfo
        
        // Read preference.
        launchAtLogin = Preferences[.launchAtLogin]
        launchCount = Preferences[.launchCount]
        userInfo = Preferences[.userInfo]
        
        // Check preferences.
        for (key, value) in userDefaults.dictionaryRepresentation() {
            print("\(key): \(value)")
        }
    }
}

