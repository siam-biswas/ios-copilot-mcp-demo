import SwiftUI

struct AmountInputView: View {
    @State private var amount: String = ""
    @State private var isActive = false
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Enter Loan Amount")
                .font(.title2)
                .bold()
            VStack(spacing: 20) {
                TextField("Amount", text: $amount)
                    .accessibilityIdentifier("amount_input_field")
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                    )
            }
            Button(action: {
                if let value = Double(amount) {
                    LoanApplicationData.shared.amount = value
                    isActive = true
                }
            }) {
                Text("Continue")
                    .accessibilityIdentifier("amount_continue_button")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            NavigationLink(value: true) {
                EmptyView()
            }
            .navigationDestination(isPresented: $isActive) {
                LoanOffersView()
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
    AmountInputView()
}
