//
//  Expense.swift
//  iExpense
//
//  Created by Jörg Klausewitz on 24.12.25.
//

import Foundation

class Expense: Identifiable, Codable {
    
    // Enum-Cases kleingeschrieben (Swift-Standard)
    enum ExpenseType: String, CaseIterable, Identifiable, Codable {
        case business
        case personal
        
        var id: Self { self }
    }
    
    // id als 'let' und im init, damit sie beim Laden aus JSON erhalten bleibt
    let id: UUID
    let name: String
    let type: ExpenseType
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: ExpenseType, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

