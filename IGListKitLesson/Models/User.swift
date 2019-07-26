//
//  User.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/23/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation

class User: NSObject {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
