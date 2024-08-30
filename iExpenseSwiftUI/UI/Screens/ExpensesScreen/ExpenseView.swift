import SwiftUI

/// View to display current expenses list
struct ExpenseView: View {

	// MARK: - State Properties

	@StateObject private var viewModel: ExpenseViewModel
	@State private var addExpenseScreenOpen = false

	// MARK: - Initalization

	/// Designated Initializer of the ExpenseView
	/// - Parameter expenses: class storage of User's expenses should be builded before the View
	init(expenses: Expenses) {
		
		// Use "_" before the property to get Property Wrapper itself instead of it's property
		_viewModel = StateObject(wrappedValue: ExpenseViewModel(expenses: expenses))
	}

	// MARK: - Body

	var body: some View {
		NavigationStack {

			// MARK: Expenses

			List {
				Section("Personal") {
					ForEach(viewModel.expenses.items) { item in
						if item.type == "Personal" {
							HStack {
								VStack {
									Text(item.name)
										.font(.headline)
									Text(item.type)
								}
								Spacer()
								restyleAmountLabel(value: item.amount,
												   currency: item.currency)
							}
						}
					}
					.onDelete(perform: viewModel.removeItems(at:))
				}

				Section("Business") {
					ForEach(viewModel.expenses.items) { item in
						if item.type == "Business" {
							HStack {
								VStack {
									Text(item.name)
										.font(.headline)
									Text(item.type)
								}
								Spacer()
								restyleAmountLabel(value: item.amount,
												   currency: item.currency)
							}
						}
					}
					.onDelete(perform: viewModel.removeItems(at:))
				}
			}

			// MARK: Navigation Stack Setup

			.navigationTitle("iExpense")
			.toolbar {
				Button("Add Expense", systemImage: "plus") {
					addExpenseScreenOpen = true
				}
			}

			// MARK: Navigation

			.sheet(isPresented: $addExpenseScreenOpen) {
				AddExpenseView(expenses: viewModel.expenses)
			}
		}
	}

	/// Restyles the amount label based on the value
	/// - Parameters:
	///   - value: The amount value in Double
	///   - currency: The currency code
	func restyleAmountLabel(value: Double, currency: String) -> some View {
		switch value {
		case 0..<10:
			Text(value, format: .currency(code: currency))
				.font(.title3)
		case 10..<100:
			Text(value, format: .currency(code: currency))
				.font(.title2)
		case 100...:
			Text(value, format: .currency(code: currency))
				.font(.title)
		default:
			Text(value, format: .currency(code: currency))
		}
	}
}

#Preview {
	ExpenseView(expenses: Expenses())
}
