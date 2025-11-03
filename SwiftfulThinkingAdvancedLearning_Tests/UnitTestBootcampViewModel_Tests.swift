//
//  UnitTestBootcampViewModel_Tests.swift
//  SwiftfulThinkingAdvancedLearning_Tests
//
//  Created by jyotirmoy_halder on 3/11/25.
//

import XCTest
@testable import SwiftfulThinkingAdvancedLearning
import Combine

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[varibale or function]_[expected result]

// Testing Structure: Given, When, Then

final class UnitTestBootcampViewModel_Tests: XCTestCase {
    
    var viewModel: UnitTestingBootcampViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootcampViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_UnitTestBootcampViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestBootcampViewModel_isPremium_shouldBefalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }

    func test_UnitTestBootcampViewModel_isPremium_shouldBeInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestBootcampViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestBootcampViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        // when
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestBootcampViewModel_dataArray_shouldAddItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
//        XCTAssertGreaterThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
//        XCTAssertLessThan(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
//        XCTAssertLessThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
    }
    
    func test_UnitTestBootcampViewModel_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestBootcampViewModel_dataArray_shouldStartAsNil() {
        // Given

        // when
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // Then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        // select valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // select invalid item
        vm.selectItem(item: UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestBootcampViewModel_selectedItem_shouldBeSelected() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_UnitTestBootcampViewModel_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestBootcampViewModel_dataArray_shouldThrowError_noData() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
    }
    
    func test_UnitTestBootcampViewModel_saveItem_shouldThrowError_itemNotFound() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not Found error!") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestBootcampViewModel_saveItem_shouldThrowError_itemNotFound_noData() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestBootcampViewModel_saveItem_shouldSaveItem() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }

        // when
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        
        // Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
    }
    
    func test_UnitTestBootcampViewModel_downloadWithEscaping_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let expectation = XCTestExpectation(description: "Should returnitems after 3 seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        
        vm.downloadWithEscaping()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestBootcampViewModel_downloadWithCombine_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())

        // when
        let expectation = XCTestExpectation(description: "Should returnitems after a seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        
        vm.downloadWithCombine()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestBootcampViewModel_downloadWithCombine_shouldReturnItems2() {
        // Given
        let items = [UUID().uuidString, UUID().uuidString, UUID().uuidString, UUID().uuidString]
        let dataService: NewDataServiceProtocol = NewMockDataService(items: items)
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random(), dataService: dataService)

        // when
        let expectation = XCTestExpectation(description: "Should returnitems after a seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        
        vm.downloadWithCombine()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        XCTAssertEqual(vm.dataArray.count, items.count)
    }
}
