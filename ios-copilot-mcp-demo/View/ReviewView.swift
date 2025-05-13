import SwiftUI

struct ReviewView: View {
    @ObservedObject private var data = LoanApplicationData.shared
    @State private var isActive = false
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Review Application")
                .font(.title2)
                .bold()
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Email:")
                        .fontWeight(.semibold)
                        .accessibilityIdentifier("review_email_label")
                    Spacer()
                    Text(data.email)
                        .foregroundColor(.secondary)
                        .accessibilityIdentifier("review_email_value")
                }
                HStack {
                    Text("Amount:")
                        .fontWeight(.semibold)
                        .accessibilityIdentifier("review_amount_label")
                    Spacer()
                    Text("$\(data.amount, specifier: "%.2f")")
                        .foregroundColor(.secondary)
                        .accessibilityIdentifier("review_amount_value")
                }
                if let offer = data.selectedOffer {
                    HStack {
                        Text("Offer:")
                            .fontWeight(.semibold)
                            .accessibilityIdentifier("review_offer_label")
                        Spacer()
                        Text(offer.title)
                            .foregroundColor(.secondary)
                            .accessibilityIdentifier("review_offer_value")
                    }
                    HStack {
                        Text("Interest:")
                            .fontWeight(.semibold)
                            .accessibilityIdentifier("review_interest_label")
                        Spacer()
                        Text("\(offer.interestRate, specifier: "%.2f")%")
                            .foregroundColor(.secondary)
                            .accessibilityIdentifier("review_interest_value")
                    }
                    HStack {
                        Text("Duration:")
                            .fontWeight(.semibold)
                            .accessibilityIdentifier("review_duration_label")
                        Spacer()
                        Text("\(offer.durationMonths) months")
                            .foregroundColor(.secondary)
                            .accessibilityIdentifier("review_duration_value")
                    }
                }
            }
            .padding(24)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color(.black).opacity(0.06), radius: 8, x: 0, y: 4)
            Button(action: {
                isActive = true
            }) {
                Text("Submit")
                    .accessibilityIdentifier("review_submit_button")
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
                SuccessView()
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
    ReviewView()
}
