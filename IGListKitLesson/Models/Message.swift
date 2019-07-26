//
//  Message.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/23/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class Message: NSObject, DateSortable {
    let date: Date
    let text: String
    let user: User

    init(date: Date, text: String, user: User) {
        self.date = date
        self.text = text
        self.user = user
    }
}
