import XCTest

class LoginViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testValidLogin() throws {
        let app = XCUIApplication()

        // Enter valid email and password
        let usernameTextField = app.textFields["Username (Email)"]
        usernameTextField.tap()
        usernameTextField.typeText("validemail@example.com")

        let passwordTextField = app.secureTextFields["Password (8 digits)"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")

        // Tap the login button
        app.buttons["Login"].tap()

        // Verify success message is displayed
        XCTAssertTrue(app.staticTexts["Login Successful!"].exists)
    }

    func testInvalidEmail() throws {
        let app = XCUIApplication()

        // Enter invalid email
        let usernameTextField = app.textFields["Username (Email)"]
        usernameTextField.tap()
        usernameTextField.typeText("invalidemail")

        let passwordTextField = app.secureTextFields["Password (8 digits)"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")

        // Tap the login button
        app.buttons["Login"].tap()

        // Verify error message is displayed
        XCTAssertTrue(app.staticTexts["Invalid username or password"].exists)
    }

    func testInvalidPassword() throws {
        let app = XCUIApplication()

        // Enter valid email and invalid password
        let usernameTextField = app.textFields["Username (Email)"]
        usernameTextField.tap()
        usernameTextField.typeText("validemail@example.com")

        let passwordTextField = app.secureTextFields["Password (8 digits)"]
        passwordTextField.tap()
        passwordTextField.typeText("123")

        // Tap the login button
        app.buttons["Login"].tap()

        // Verify error message is displayed
        XCTAssertTrue(app.staticTexts["Invalid username or password"].exists)
    }

    func testEmptyFields() throws {
        let app = XCUIApplication()

        // Leave both fields empty
        app.buttons["Login"].tap()

        // Verify error message is displayed
        XCTAssertTrue(app.staticTexts["Invalid username or password"].exists)
    }

    override func tearDownWithError() throws {
        // Add any cleanup code as needed
    }
}
