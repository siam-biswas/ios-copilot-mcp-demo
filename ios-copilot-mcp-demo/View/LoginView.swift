import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .accessibilityIdentifier("login_email_field")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                        )
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                        .accessibilityIdentifier("login_password_field")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                        )
                }
                Button(action: {
                    LoanApplicationData.shared.email = email
                    isActive = true
                }) {
                    Text("Login")
                        .accessibilityIdentifier("login_button")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .font(.headline)
                }
                .padding(.top)
                NavigationLink(value: true) {
                    EmptyView()
                }
                .navigationDestination(isPresented: $isActive) {
                    AmountInputView()
                }
            }
            .padding(32)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .shadow(color: Color(.black).opacity(0.08), radius: 16, x: 0, y: 8)
            )
            .padding(.horizontal, 24)
            .frame(maxWidth: 500)
            .frame(maxHeight: .infinity, alignment: .center)
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
