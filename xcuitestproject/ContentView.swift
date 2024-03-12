import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showSuccessMessage = false
    @State private var showErrorMessage = false

    var body: some View {
        VStack {
            TextField("Username (Email)", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            SecureField("Password (8 digits)", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            Button(action: {
                self.login()
            }) {
                Text("Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            if showSuccessMessage {
                Text("Login Successful!")
                    .foregroundColor(.green)
                    .padding()
            }

            if showErrorMessage {
                Text("Invalid username or password")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }

    func login() {
        // Validate email
        guard isValidEmail(username) else {
            // Show an error message for invalid email
            print("Invalid email address")
            showSuccessMessage = false
            showErrorMessage = true
            return
        }

        // Validate password length
        guard password.count == 8 else {
            // Show an error message for invalid password length
            print("Password must be 8 digits")
            showSuccessMessage = false
            showErrorMessage = true
            return
        }

        // If both username and password are valid, show success message
        showSuccessMessage = true
        showErrorMessage = false
        print("Login Successful!")
    }

    // Simple email validation function
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
