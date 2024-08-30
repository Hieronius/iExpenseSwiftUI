import Foundation

/// Type of the expense to add into the list
struct ExpenseItem: Identifiable, Codable {

	// MARK: - Properties

	/// Unique ID for our operations
	var id = UUID()

	/// Name of the expense operation
	let name: String

	/// Type of the expense operation
	let type: String

	/// Currency
	let currency: String

	/// An amount of expense operation
	let amount: Double
}
