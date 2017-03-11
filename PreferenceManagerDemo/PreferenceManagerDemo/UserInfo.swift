//
//  UserInfo.swift
//  PreferenceManagerDemo
//
//  Created by Lizhen Hu on 10/03/2017.
//  Copyright © 2017 Lizhen Hu. All rights reserved.
//

import UIKit

final class UserInfo: NSObject, NSCoding {
    var id = 0
    var name = ""
    
    convenience init(id: Int, name: String) {
        self.init()

        self.id = id
        self.name = name
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        self.init()

        for child in Mirror(reflecting: self).children {
            if let key = child.label {
                setValue(aDecoder.decodeObject(forKey: key), forKey: key)
            }
        }
    }
    
    func encode(with aCoder: NSCoder) {
        for child in Mirror(reflecting: self).children {
            if let key = child.label {
                aCoder.encode(value(forKey: key), forKey: key)
            }
        }
    }
}
