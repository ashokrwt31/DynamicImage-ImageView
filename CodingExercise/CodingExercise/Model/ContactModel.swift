//
//  ContactModel.swift
//  CodingExercise
//
//  Created by Ashok Rawat on 26/12/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import Foundation

// MARK: - Model Class collection
struct ContactModel: Codable {
    var contacts: [ContactItem]?
}

// MARK: - Model Class item for showing data
struct ContactItem: Codable {
    var first_name: String!
    var image_url: String!
    var last_name: String!
    var tag_handle: String!
}
