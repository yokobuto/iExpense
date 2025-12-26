//
//  ExpenseManager.swift
//  iExpense
//
//  Created by Jörg Klausewitz on 24.12.25.
//

import Foundation
import SwiftUI


@Observable
class ExpenseManager{

    var expenses = [Expense]() {
        didSet{
            
            if let encoded = try? JSONEncoder().encode(expenses){
                UserDefaults.standard.set(encoded, forKey: "Expenses")
            }
            
        }
    }
    
    func removeExpense(at offsets: IndexSet) {
            expenses.remove(atOffsets: offsets)
    }
    
    func addExpense(expense: Expense){
        expenses.append(expense)
    }
    
    init(){
        
        if let savedExpenses = UserDefaults.standard.data(forKey: "Expenses"){
            if let decodedExpenses = try? JSONDecoder().decode([Expense].self, from: savedExpenses){
                expenses = decodedExpenses
                return
            }
        }
        
        expenses = [Expense]()
    }
    

    
    
    
    
}
