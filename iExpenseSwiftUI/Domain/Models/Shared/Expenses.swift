import SwiftUI
import Observation

/// Our storage to manage User's expenses
@Observable
final class Expenses {

	// MARK: - Properties

	/// Actual User's operations
	var items: [ExpenseItem] = [] {
		didSet {
			guard let encodedItems = try? JSONEncoder().encode(items) else { return }
			UserDefaults.standard.set(encodedItems, forKey: "Items")
		}
	}

	// MARK: - Initialization

	init() {
		guard let savedItems = UserDefaults.standard.data(forKey: "Items") else { return }
		guard let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems)
		else {
			items = []
			return
		}
		items = decodedItems
	}
}
