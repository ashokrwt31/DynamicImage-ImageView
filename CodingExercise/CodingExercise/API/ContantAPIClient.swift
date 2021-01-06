//
//  ContantAPIClient.swift
//  CodingExercise
//
//  Created by Nick Konieczko on 6/8/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import Foundation

protocol ContactAPIClientProtocol {
    func getContacts(completion: @escaping (Data) -> Void)
}

/*
 DO NOT MODIFY
 */
class ContantAPIClient: ContactAPIClientProtocol {
    private let json = """
    {
        "contacts": [
            {
                "first_name": "Dexter",
                "last_name": "Morgan",
                "tag_handle": "dmorgan",
                "image_url": "https://s.sho.com/2AexxTh"
            },
            {
                "first_name": "John",
                "last_name": "Locke",
                "tag_handle": "TheIsland",
                "image_url": "https://bit.ly/3hdKYUn"
            },
            {
                "first_name": "James",
                "last_name": "Ford",
                "tag_handle": "TheRealSawyer",
                "image_url": "https://bit.ly/2BE2Mr8"
            },
            {
                "first_name": "Charlie",
                "last_name": "Kelly",
                "tag_handle": "Trundle",
                "image_url": "https://bit.ly/3f7T4fj"
            },
            {
                "first_name": "Bobby",
                "last_name": "Axelrod",
                "tag_handle": "Billions",
                "image_url": "https://bit.ly/3eVoB3Y"
            },
        ]
    }
    """.data(using: .utf8)!
    
    func getContacts(completion: @escaping ((Data) -> Void)) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.3) {
            completion(self.json)
        }
    }
}
