//
//  ContactViewModel.swift
//  CodingExercise
//
//  Created by Ashok Rawat on 26/12/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import Foundation

class ContactViewModel: NSObject {
    private let contactAPI: ContantAPIClient
    var contacts: [ContactItem] = []
    init(contactAPI: ContantAPIClient) {
        self.contactAPI = contactAPI
    }
    
    // MARK: - Get Data from ContactAPI Client 
    func getContactData(completion: @escaping () -> Void){
        contactAPI.getContacts { (data) in
            do {
                let jsonDecoder = JSONDecoder.init()
                let contactResult = try jsonDecoder.decode(ContactModel.self, from: data)
                if let result = contactResult.contacts {
                    self.contacts = result
                }
                completion()
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
    }
}

