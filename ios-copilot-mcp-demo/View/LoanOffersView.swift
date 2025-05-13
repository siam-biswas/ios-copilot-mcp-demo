import SwiftUI

struct LoanOffersView: View {
    @ObservedObject private var data = LoanApplicationData.shared
    @State private var isActive = false
    
    var offers: [LoanOffer] {
        return [
            LoanOffer(title: "Standard", interestRate: 5.5, durationMonths: 12),
            LoanOffer(title: "Premium", interestRate: 4.2, durationMonths: 24),
            LoanOffer(title: "Express", interestRate: 6.0, durationMonths: 6)
        ]
    }
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Select a Loan Offer")
                .font(.title2)
                .bold()
            VStack(spacing: 20) {
                ForEach(offers) { offer in
                    Button(action: {
                        data.selectedOffer = offer
                    }) {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(offer.title)
                                    .font(.headline)
                                    .accessibilityIdentifier("offer_title_\(offer.title)")
                                Text("Interest: \(offer.interestRate, specifier: "%.2f")%")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .accessibilityIdentifier("offer_interest_\(offer.title)")
                                Text("Duration: \(offer.durationMonths) months")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .accessibilityIdentifier("offer_duration_\(offer.title)")
                                Text("Amount: $\(data.amount, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .accessibilityIdentifier("offer_amount_\(offer.title)")
                            }
                            Spacer()
                            if data.selectedOffer == offer {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                    .accessibilityIdentifier("offer_selected_\(offer.title)")
                            }
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                        .shadow(color: Color(.black).opacity(0.06), radius: 8, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(( data.selectedOffer == offer) ? Color.primary : Color.clear, lineWidth: ( data.selectedOffer == offer) ? 3 : 2)
                        )
                    }
                    .buttonStyle(.plain)
                    .accessibilityIdentifier("offer_button_\(offer.title)")
                }
            }
            Button(action: {
                isActive = true
            }) {
                Text("Continue")
                    .accessibilityIdentifier("offers_continue_button")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(data.selectedOffer != nil ? Color.blue : Color.gray.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            .disabled(data.selectedOffer == nil)
            NavigationLink(value: true) {
                EmptyView()
            }
            .navigationDestination(isPresented: $isActive) {
                ReviewView()
            }
        }
        .padding(32)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: Color(.black).opacity(0.08), radius: 16, x: 0, y: 8)
        )
        .padding(.horizontal, 24)
        .frame(maxWidth: 600)
        .frame(maxHeight: .infinity, alignment: .center)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoanOffersView()
}
