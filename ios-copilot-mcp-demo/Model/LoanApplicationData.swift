import Foundation

class LoanApplicationData: ObservableObject {
    static let shared = LoanApplicationData()
    
    @Published var email: String = ""
    @Published var amount: Double = 0.0
    @Published var selectedOffer: LoanOffer?
    
    private init() {}
}

struct LoanOffer: Identifiable, Equatable {
    var id: String { title }
    let title: String
    let interestRate: Double
    let durationMonths: Int
    
    var description: String {
        "\(title): \(interestRate)% for \(durationMonths) months"
    }
}
