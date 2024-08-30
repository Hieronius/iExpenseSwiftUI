//
//  iExpenseSwiftUIApp.swift
//  iExpenseSwiftUI
//
//  Created by Халимовский Арсентий Владимирович on 24.08.2024.
//

import SwiftUI

@main
struct iExpenseSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ExpenseView(expenses: Expenses())
        }
    }
}
