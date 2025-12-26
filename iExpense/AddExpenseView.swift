//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Jörg Klausewitz on 26.12.25.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type: Expense.ExpenseType = .business
    @State private var amount = 0.0
    
    var expenseManager: ExpenseManager
    

    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(Expense.ExpenseType.allCases){ expenseType in
                        Text(expenseType.rawValue.capitalized).tag(expenseType)
                    }
                }.pickerStyle(.segmented)
                
                
                TextField("Amount", value: $amount, format: .currency(code: "EUR")).keyboardType(.decimalPad)
            }.navigationTitle("Add New Expense")
                .toolbar{
                    Button("Save"){
                        let expense = Expense(name: name, type: type, amount: amount)
                        
                        expenseManager.addExpense(expense: expense)
                        
                        dismiss()
                    }
                }
            
        }
        
    }
}

#Preview {
    AddExpenseView(expenseManager: ExpenseManager())
}
