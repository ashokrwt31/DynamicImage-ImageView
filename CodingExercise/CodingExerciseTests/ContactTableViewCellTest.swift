//
//  ContactTableViewCellTest.swift
//  CodingExerciseTests
//
//  Created by Ashok Rawat on 26/12/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import Foundation
import XCTest
@testable import CodingExercise

class ContactTableViewCellTest: XCTestCase {
 var cell: ContactTableViewCell?
    override func setUp() {
        super.setUp()
        let bundle = Bundle.main
        let nib = bundle.loadNibNamed("ContactTableViewCell", owner: nil, options: nil)
        cell = nib?.first as? ContactTableViewCell
    }
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    func testConfigureCell() {
        let item = ContactItem(first_name: "Contact", image_url: "test", last_name: "Example", tag_handle: "cExample")
        cell?.configureCell(item)
        XCTAssertEqual(cell?.userTag.text, "cExample")
    }
}
