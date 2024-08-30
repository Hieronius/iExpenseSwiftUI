import SwiftUI

final class AddExpenseViewModel: ObservableObject {

	// MARK: - Published Properties

	@Published var name = ""
	@Published var type = "Personal"
	@Published var currency = "USD"
	@Published var amount = 0.0

	// MARK: - Properties

	/// Type of operation to choose
	let types = ["Business", "Personal"]

	/// Currency of operation to choose
	let currencies = ["USD", "JPY", "KRW", "RUB", "EUR", "GBP"]

	// MARK: - Private Properties

	private let expenses: Expenses

	// MARK: - Initialization

	/// Designated Initializer of the AddExpenseViewModel
	/// - Parameter expenses: class storage of User's expenses
	init(expenses: Expenses) {
		self.expenses = expenses
	}

	// MARK: - Public Methods

	/// Adds a new expense item to the provided expenses
	/// - Parameter expenses: The expenses object to which the new item will be added
	func addExpense() {
		let items = ExpenseItem(
			name: name,
			type: type,
			currency: currency,
			amount: amount
		)
		expenses.items.append(items)
	}

}
