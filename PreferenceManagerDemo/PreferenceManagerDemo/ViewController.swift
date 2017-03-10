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
        
        // Register default preferences.
        var userInfoData = NSKeyedArchiver.archivedData(withRootObject: UserInfo(id: 0, name: ""))
        let defaultPreferences: [String: Any] = [
            PreferenceKey.launchAtLogin: false,
            PreferenceKey.launchCount: 0,
            PreferenceKey.userInfo: userInfoData,
            ]
        userDefaults.register(defaults: defaultPreferences)
        
        // Test data.
        var launchAtLogin = true
        var launchCount = 10
        var userInfo = UserInfo(id: 121, name: "Fox")
        userInfoData = NSKeyedArchiver.archivedData(withRootObject: userInfo)
        
        // Write preferences.
        userDefaults.set(launchAtLogin, forKey: PreferenceKey.launchAtLogin)
        userDefaults.set(launchCount, forKey: PreferenceKey.launchCount)
        userDefaults.set(userInfoData, forKey: PreferenceKey.userInfo)
        
        // Read preferences.
        launchAtLogin = userDefaults.bool(forKey: PreferenceKey.launchAtLogin)
        launchCount = userDefaults.integer(forKey: PreferenceKey.launchCount)
        userInfoData = userDefaults.object(forKey: PreferenceKey.userInfo) as! Data
        userInfo = NSKeyedUnarchiver.unarchiveObject(with: userInfoData) as! UserInfo
        
        // Check preferences.
        for (key, value) in userDefaults.dictionaryRepresentation() {
            print("\(key): \(value)")
        }
    }
}

