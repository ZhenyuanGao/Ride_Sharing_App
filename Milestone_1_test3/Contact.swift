//
//  test_comparsion.swift
//  Milestone_1_test3
//
//  Created by Kevin Gao on 4/4/20.
//  Copyright © 2020 Kevin Gao. All rights reserved.
//

import Foundation

class Contact {
    let id: Int64?
    var name: String
    var phone: String
    var address: String

    init(id: Int64) {
        self.id = id
        name = ""
        phone = ""
        address = ""
    }

    init(id: Int64, name: String, phone: String, address: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
    }
}
