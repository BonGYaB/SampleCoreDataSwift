//
//  DummyDatabase.swift
//  SampleCoreDataSwiftTests
//
//  Created by MCNC on 28/2/2564 BE.
//

@testable import SampleCoreDataSwift
import XCTest

class DummyDatabase: XCTestCase {
    
    override func setUp() {
        super.setUp()
//        self.createItem(name: "test unit test")
        XCTAssertTrue(createItem(name: ""))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [ToDoListItem]()
    let tableView: UITableView = { () -> UITableView in
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "coreDataCell")
        return table
    }()
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            // Error
        }
    }
    
    func createItem(name: String) -> Bool {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.created_at = Date()
        
        do {
            try context.save()
            getAllItems()
            return true
        }
        catch {
            return false
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        do {
            try context.save()
        }
        catch {
            // Error
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        do {
            try context.save()
        }
        catch {
            // Error
        }
    }
    

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

}
