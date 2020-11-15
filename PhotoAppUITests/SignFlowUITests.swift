//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by David SG on 02/11/2020.
//

import XCTest

class SignFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var familyName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"] // Accessibility Identifier
        familyName = app.textFields["familyNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        app = nil
        firstName = nil
        familyName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        
        try super.tearDownWithError()
    }
    
    func test_SignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "firstName UITextField is not enabled for user interactions")
        XCTAssertTrue(familyName.isEnabled, "familyName UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "repeatPassword UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "buttonLogin UIButton is not enabled for user interactions")
    }
    
    func test_ViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        
        // Arrange
        firstName.tap()
        firstName.typeText("S")
        
        familyName.tap()
        familyName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123")
        
        repeatPassword.tap()
        repeatPassword.typeText("12")

        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error dialog was not presented when invalid signup form was submitted.")
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
