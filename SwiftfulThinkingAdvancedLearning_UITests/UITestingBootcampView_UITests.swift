//
//  UITestingBootcampView_UITests.swift
//  SwiftfulThinkingAdvancedLearning_UITests
//
//  Created by jyotirmoy_halder on 4/11/25.
//

import XCTest


// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[varibale or function]_[expected result]

// Testing Structure: Given, When, Then


class UITestingBootcampView_UITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
//        app.launchArguments = ["-UITest_startSignedIn"]
//        app.launchEnvironment = ["-UITest_startSignedIn2" : "true"]
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: false)
        
        // When
        let navBar = app.navigationBars["Welcome!"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        let navBar = app.navigationBars["Welcome!"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: false)
        
        // Then
        let alertOkButton = app.buttons["AlertDismissOkButton"]
        XCTAssertTrue(alertOkButton.exists)
        
    }
    
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDudmissAlert() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: true)
        
        // Then
        let alertOkButtonexists = app.buttons["AlertDismissOkButton"].waitForExistence(timeout: 5)
        XCTAssertFalse(alertOkButtonexists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: false)
        
        let destinationText = app.staticTexts["Destination"]
        
        // Then
        XCTAssertTrue(destinationText.exists)
        
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)
        
        // Then
        let navBar = app.navigationBars["Welcome!"]

        XCTAssertTrue(navBar.exists)

    }
    
//    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack2() {
//        // Given
//        
//        // When
//        tapNavigationLink(shouldDismissDestination: true)
//        
//        // Then
//        let navBar = app.navigationBars["Welcome!"]
//
//        XCTAssertTrue(navBar.exists)
//
//    }
    
}

// MARK: FUNCTIONS

extension UITestingBootcampView_UITests {
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        let textField = app.textFields["SignUpTextField"]
        textField.tap()
        
        if shouldTypeOnKeyboard {
            let Akey = app.keys["A"]
            Akey.tap()
            let aKey = app.keys["a"]
            aKey.tap()
            aKey.tap()
            aKey.tap()
            aKey.tap()
            aKey.tap()
        }
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
    
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert {
            let alertOkButton = app.buttons["AlertDismissOkButton"]
            
            let showAlertButtonexists = showAlertButton.waitForExistence(timeout: 5)
            XCTAssertTrue(showAlertButtonexists)
            
            alertOkButton.tap()
        }
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        if shouldDismissDestination {
            let backButton = app.buttons["Welcome!"]
            backButton.tap()
        }
    }
}
