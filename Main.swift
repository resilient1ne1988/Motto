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

struct BusinessModel: View {
    var valuePropositions: [String]
    var customerSegments: [String]
    var channels: [String]
    var revenueStreams: [String]
    var keyActivities: [String]
    var keyResources: [String]
    var keyPartners: [String]
    var costStructure: [String]
    var customerRelationships: [String]
    var revenueStreamsDetailed: [(description: String, amount: Double)]
    var loanRequested: Bool
    var grantRequested: Bool

    // New variables:
    var targetMarketSize: Int // Estimated size of the target market
    var marketGrowthRate: Double // Annual growth rate of the target market
    var competitiveLandscape: [String] // Description of key competitors
    var competitiveAdvantage: [String] // Key differentiators from competitors
    var marketingStrategy: [String] // Outline of marketing tactics
    var salesStrategy: [String] // Description of sales approach
    var team: [String] // Key personnel and their roles
    var legalStructure: String // Business entity type (e.g., LLC, Sole Proprietorship)
    var regulatoryCompliance: [String] // Relevant licenses and permits
    var financialProjections: [(year: Int, revenue: Double, expenses: Double)] // Projected financial data
    var riskAssessment: [String] // Potential risks and mitigation strategies
    var exitStrategy: String // Planned exit strategy for the business
    var milestones: [(timeFrame: Int, description: String)] // Key milestones and timelines
    var socialImpact: [String] // Positive impact on society or the environment
}

func generateDetailedBusinessModel(businessGoal: String, desiredIncome: Double, investmentAmount: Double, grantRequested: Bool, loanRequested: Bool, timeFrame: Int) -> BusinessModel {
    let model = BusinessModel(
        valuePropositions: [
            "Cutting-edge technology integration",
            "Unmatched customer service",
            "Sustainability and eco-friendliness",
            "Affordable luxury"
        ],
        customerSegments: [
            "Tech-savvy professionals",
            "Environmental enthusiasts",
            "Luxury seekers on a budget",
            "Small to mid-sized enterprises"
        ],
        channels: [
            "E-commerce platform",
            "Mobile app",
            "Retail partnerships",
            "Direct sales team"
        ],
        revenueStreams: [
            "Product sales",
            "Subscription-based services",
            "Premium support packages",
            "Affiliate marketing"
        ],
        keyActivities: [
            "Continuous research and development",
            "Strategic marketing campaigns",
            "Customer support and engagement",
            "Supply chain optimization"
        ],
        keyResources: [
            "Innovative tech team",
            "Extensive customer database",
            "Strong brand presence",
            "Robust supply chain"
        ],
        keyPartners: [
            "Leading tech suppliers",
            "Marketing agencies",
            "Logistics providers",
            "Environmental organizations"
        ],
        costStructure: [
            "Research and development expenses",
            "Marketing and advertising costs",
            "Manufacturing and distribution expenses",
            "Operational overheads"
        ],
        customerRelationships: [
            "Dedicated account managers",
            "Loyalty programs",
            "Personalized customer engagement",
            "Community building initiatives"
        ],
        revenueStreamsDetailed: [
            ("Product sales", 1000000.00),
            ("Subscription-based services", 500000.00),
            ("Premium support packages", 250000.00),
            ("Affiliate marketing", 150000.00)
        ],
        loanRequested: loanRequested,
        grantRequested: grantRequested,
        targetMarketSize: 100000, // Example value
        marketGrowthRate: 0.15, // Example value
        competitiveLandscape: [
            "Company A",
            "Company B",
            "Company C"
        ], // Example values
        competitiveAdvantage: [
            "Superior technology",
            "Strong brand reputation",
            "Excellent customer service"
        ], // Example values
        marketingStrategy: [
            "Social media marketing",
            "Search engine optimization (SEO)",
            "Content marketing"
        ], // Example values
        salesStrategy: [
            "Direct sales",
            "Partner channels",
            "Online sales"
        ], // Example values
        team: [
            "CEO - John Doe",
            "CTO - Jane Smith",
            "Marketing Manager - Robert Jones"
        ], // Example values
        legalStructure: "LLC", // Example value
        regulatoryCompliance: [
            "Business license",
            "Environmental permits"
        ], // Example values
        financialProjections: [
            (year: 2023, revenue: 1500000.00, expenses: 1000000.00),
            (year: 2024, revenue: 2000000.00, expenses: 1200000.00)
        ], // Example values
        riskAssessment: [
            "Competition",
            "Economic downturn"
        ], // Example values
        exitStrategy: "Sale of the business", // Example value
        milestones: [
            (timeFrame: 6, description: "Product launch"),
            (timeFrame: 12, description: "Achieve profitability")
        ], // Example values
        socialImpact: [
            "Creating jobs",
            "Reducing environmental impact"
        ] // Example values
    )
    return model
}

func generateLoanApplication(businessModel: BusinessModel) -> String {
    return """
    Loan Application for \(businessModel.valuePropositions.joined(separator: ", ")):

    To Whom It May Concern,

    I am writing to request a business loan to support the expansion and development of our innovative solutions. Our business focuses on cutting-edge technology integration, unmatched customer service, sustainability and eco-friendliness, and affordable luxury. We cater to tech-savvy professionals, environmental enthusiasts, luxury seekers on a budget, and small to mid-sized enterprises.

    Our key activities include continuous research and development, strategic marketing campaigns, customer support and engagement, and supply chain optimization. We have a strong brand presence and a robust supply chain, supported by our innovative tech team and extensive customer database.

    We are confident that with the additional financial support, we can achieve significant growth and continue to provide exceptional value to our customers.

    Sincerely,
    [Your Name]
    """
}

func generateGrantApplication(businessModel: BusinessModel) -> String {
    return """
    Grant Application for \(businessModel.valuePropositions.joined(separator: ", ")):

    To Whom It May Concern,

    I am writing to apply for a grant to further our efforts in integrating cutting-edge technology, providing unmatched customer service, promoting sustainability and eco-friendliness, and offering affordable luxury. Our target market includes tech-savvy professionals, environmental enthusiasts, luxury seekers on a budget, and small to mid-sized enterprises.

    Our key activities involve continuous research and development, strategic marketing campaigns, customer support and engagement, and supply chain optimization. We have established strong partnerships with leading tech suppliers, marketing agencies, logistics providers, and environmental organizations.

    This grant will enable us to advance our initiatives and create a lasting impact on our community and the environment.

    Sincerely,
    [Your Name]
    """
}

func printBusinessModelAndApplications(_ model: BusinessModel) {
    print("=== Business Model Presentation ===")
    print("Value Propositions:")
    model.valuePropositions.forEach { print("- \($0)") }
    print("\nCustomer Segments:")
    model.customerSegments.forEach { print("- \($0)") }
    print("\nChannels:")
    model.channels.forEach { print("- \($0)") }
    print("\nRevenue Streams:")
    model.revenueStreams.forEach { print("- \($0)") }
    print("\nKey Activities:")
    model.keyActivities.forEach { print("- \($0)") }
    print("\nKey Resources:")
    model.keyResources.forEach { print("- \($0)") }
    print("\nKey Partners:")
    model.keyPartners.forEach { print("- \($0)") }
    print("\nCost Structure:")
    model.costStructure.forEach { print("- \($0)") }
    print("\nCustomer Relationships:")
    model.customerRelationships.forEach { print("- \($0)") }
    print("\nRevenue Streams (Detailed):")
    model.revenueStreamsDetailed.forEach { print("- \($0.description): $\(String(format: "%.2f", $0.amount))") }
    print("\nTarget Market Size: \(model.targetMarketSize)")
    print("\nMarket Growth Rate: \(model.marketGrowthRate)")
    print("\nCompetitive Landscape:")
    model.competitiveLandscape.forEach { print("- \($0)") }
    print("\nCompetitive Advantage:")
    model.competitiveAdvantage.forEach { print("- \($0)") }
    print("\nMarketing Strategy:")
    model.marketingStrategy.forEach { print("- \($0)") }
    print("\nSales Strategy:")
    model.salesStrategy.forEach { print("- \($0)") }
    print("\nTeam:")
    model.team.forEach { print("- \($0)") }
    print("\nLegal Structure: \(model.legalStructure)")
    print("\nRegulatory Compliance:")
    model.regulatoryCompliance.forEach { print("- \($0)") }
    print("\nFinancial Projections:")
    model.financialProjections.forEach { print("- Year \($0.year): Revenue $\(String(format: "%.2f", $0.revenue)), Expenses $\(String(format: "%.2f", $0.expenses))") }
    print("\nRisk Assessment:")
    model.riskAssessment.forEach { print("- \($0)") }
    print("\nExit Strategy: \(model.exitStrategy)")
    print("\nMilestones:")
    model.milestones.forEach { print("- Timeframe: \($0.timeFrame) months, Description: \($0.description)") }
    print("\nSocial Impact:")
    model.socialImpact.forEach { print("- \($0)") }

    if model.loanRequested {
        print("\n=== Loan Application ===")
        print(generateLoanApplication(businessModel: model))
    }

    if model.grantRequested {
        print("\n=== Grant Application ===")
        print(generateGrantApplication(businessModel: model))
    }

    print("\n=== End of Presentation ===")
}

// Create the App structure
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Start the SwiftUI app
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(App.self), NSStringFromClass(AppDelegate.self))
