import SwiftUI

/// View for the new expense operation screen
struct AddExpenseView: View {

	// MARK: - Environmet Properties

	@Environment(\.dismiss) private var dissmiss

	// MARK: - State Properties

	@StateObject private var viewModel: AddExpenseViewModel


	// MARK: - Initialization

	/// Designated Initializer of the AddExpenseView
	/// - Parameter expenses: class storage of User's expenses
	init(expenses: Expenses) {
		_viewModel = StateObject(wrappedValue: AddExpenseViewModel(expenses: expenses))
	}

	// MARK: - Body

	var body: some View {
		NavigationStack {
			Form {
				TextField("Name", text: $viewModel.name)

				Picker("Type", selection: $viewModel.type) {
					ForEach(viewModel.types, id: \.self) {
						Text($0)
					}
				}

				Picker("Currency", selection: $viewModel.currency) {
					ForEach(viewModel.currencies, id: \.self) {
						Text($0)
					}
				}

				TextField("Amount", value: $viewModel.amount, format: .currency(code: viewModel.currency))
					.keyboardType(.decimalPad)
			}
			.navigationTitle("Add new expense")
			.toolbar {
				Button("Save") {
					viewModel.addExpense()
					dissmiss()
				}
			}
		}
	}
}

#Preview {
	AddExpenseView(expenses: Expenses())
}
