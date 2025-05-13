import SwiftUI

struct SuccessView: View {
    @State private var isNewAppActive = false
    @State private var isLogoutActive = false
    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .padding(.top, 24)
                .accessibilityIdentifier("success_icon")
            Text("Loan Application Submitted!")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .accessibilityIdentifier("success_title")
            Text("Your loan application was successfully submitted. We will contact you soon.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("success_message")
            Button(action: {
                isNewAppActive = true
            }) {
                Text("New Application")
                    .accessibilityIdentifier("success_new_application_button")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            Button(action: {
                // Clear session data
                LoanApplicationData.shared.email = ""
                LoanApplicationData.shared.amount = 0.0
                LoanApplicationData.shared.selectedOffer = nil
                isLogoutActive = true
            }) {
                Text("Logout")
                    .accessibilityIdentifier("success_logout_button")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            NavigationLink(value: true) {
                EmptyView()
            }
            .navigationDestination(isPresented: $isNewAppActive) {
                AmountInputView()
            }
            NavigationLink(value: true) {
                EmptyView()
            }
            .navigationDestination(isPresented: $isLogoutActive) {
                LoginView()
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
        .navigationBarBackButtonHidden(true)
    }

}

#Preview {
    SuccessView()
}
