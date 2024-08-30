import SwiftUI

final class ExpenseViewModel: ObservableObject {

	// MARK: - Properties

	@Published var expenses: Expenses

	// MARK: - Initialization
	
	/// Designated Initializer of the ExpenseViewModel
	/// - Parameter expenses: class storage of User's expenses
	init(expenses: Expenses) {
		self.expenses = expenses
	}

	// MARK: - Public Methods

	/// Remove items from the expenses list
	/// - Parameter offsets: The indices of the items to be removed
	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}
