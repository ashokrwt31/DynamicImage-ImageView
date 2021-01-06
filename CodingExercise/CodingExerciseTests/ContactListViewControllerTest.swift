//
//  ContactListViewControllerTest.swift
//  CodingExerciseTests
//
//  Created by Ashok Rawat on 26/12/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import Foundation
import XCTest
@testable import CodingExercise

class ContactListViewControllerTest: XCTestCase {
    var vc: ContactListViewController?
    override func setUp() {
        super.setUp()
        self.vc = ContactListViewController()
        self.vc?.loadView()
        self.vc?.viewDidLoad()
    }
    override func tearDown() {
        self.vc = nil
        super.tearDown()
    }
    func test_ViewLoad() {
        XCTAssertNotNil(self.vc?.view, "View not initiated properly")
    }
    func testTableViewLoads() {
        XCTAssertNotNil(self.vc?.tableView, "TableView not initiated");
    }
    func testTableViewHasDataSource() {
        XCTAssertNotNil(self.vc?.tableView.dataSource, "Table datasource cannot be nil");
    }
    func testTableViewIsConnectedToDelegate() {
        XCTAssertNotNil(self.vc?.tableView.delegate, "Table delegate cannot be nil")
    }
    
    func test_CellForRowAtIndexPath() {
        let _ = Bundle.main.loadNibNamed("ContactTableViewCell", owner: nil, options: nil)?.first as? ContactTableViewCell
        var contactItem: [ContactItem] = []
        contactItem.append(ContactItem(first_name: "Test", image_url: "test", last_name: "First", tag_handle: "tFirst"))
        self.vc?.contactViewModel?.contacts = contactItem
        self.vc?.tableView.reloadData()
        self.vc?.tableView.dataSource?.tableView((self.vc?.tableView)!, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(self.vc?.tableView.cellForRow(at: IndexPath(row: 0, section: 0)), "Table cell is not configure properly")
    }
    
    func test_NumberOfRowsInSection() {
        var contactItem: [ContactItem] = []
        contactItem.append(ContactItem(first_name: "Test", image_url: "test", last_name: "First", tag_handle: "tFirst"))
        self.vc?.contactViewModel?.contacts = contactItem
        let rowsCount = self.vc?.tableView.dataSource?.tableView((self.vc?.tableView)!, numberOfRowsInSection: 1)
        XCTAssertEqual(rowsCount, 1, "Table view rows are not equal")
    }
}
