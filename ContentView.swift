import SwiftUI

struct ContentView: View {
    @State private var businessGoal: String = ""
    @State private var desiredIncome: Double = 0.0
    @State private var investmentAmount: Double = 0.0
    @State private var grantRequested: Bool = false
    @State private var loanRequested: Bool = false
    @State private var timeFrame: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Business Details")) {
                    TextField("Business Goal", text: $businessGoal)
                    TextField("Desired Income", value: $desiredIncome, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    TextField("Investment Amount", value: $investmentAmount, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Funding Options")) {
                    Toggle("Grant Requested", isOn: $grantRequested)
                    Toggle("Loan Requested", isOn: $loanRequested)
                }
                Section(header: Text("Timeframe")) {
                    Stepper("Timeframe (Months): \(timeFrame)", value: $timeFrame, in: 0...12)
                }
                Button("Generate Business Model") {
                    let model = generateDetailedBusinessModel(businessGoal: businessGoal, desiredIncome: desiredIncome, investmentAmount: investmentAmount, grantRequested: grantRequested, loanRequested: loanRequested, timeFrame: timeFrame)
                    printBusinessModelAndApplications(model)
                }
            }
            .navigationTitle("Business Model Generator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()import SwiftUI

struct ContentView: View {
    // ... (rest of the code from above) ...
}

struct BusinessModel: View {
    // ... (your existing BusinessModel struct) ...
}

func generateDetailedBusinessModel(businessGoal: String, desiredIncome: Double, investmentAmount: Double, grantRequested: Bool, loanRequested: Bool, timeFrame: Int) -> BusinessModel {
    // ... (your existing generateDetailedBusinessModel function) ...
}

func generateLoanApplication(businessModel: BusinessModel) -> String {
    // ... (your existing generateLoanApplication function) ...
}

func generateGrantApplication(businessModel: BusinessModel) -> String {
    // ... (your existing generateGrantApplication function) ...
}

func printBusinessModelAndApplications(_ model: BusinessModel) {
    // ... (your existing printBusinessModelAndApplications function) ...
}

// Create the App structure
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
    }
}
