//
//  ContentView.swift
//  iExpense
//
//  Created by Jörg Klausewitz on 23.12.25.
//

import SwiftUI
import Observation



struct ContentView: View {
    
    @State private var expenseManager = ExpenseManager()
    
    @State private var showingAddExpenseView = false

    
    
    var body: some View {
        
        
        NavigationStack{
            
            List{
                
                Section("Personal"){
                    
                    ForEach(expenseManager.expenses.filter{ $0.type == .personal }  ){ expense in
                        ZStack{
                            ZStack{
                                Circle()
                                    .fill(expense.type == .personal ? .green : .red)
                                    .frame(width: 30)
                                Text(expense.type == .business ? "B" : "P")
                                    .foregroundStyle(.white)
                            }
                            
                            HStack{
                                Text("\(expense.name)")
                                Spacer()
                                Text(expense.amount, format: .currency(code: "EUR"))
                            }
                        }
                    }.onDelete(perform: expenseManager.removeExpense)
                    
                }
                
                
                Section("Business"){
                    
                    ForEach(expenseManager.expenses.filter{ $0.type == .business }  ){ expense in
                        ZStack{
                            ZStack{
                                Circle()
                                    .fill(expense.type == .personal ? .green : .red)
                                    .frame(width: 30)
                                Text(expense.type == .business ? "B" : "P")
                                    .foregroundStyle(.white)
                            }
                            
                            HStack{
                                Text("\(expense.name)")
                                Spacer()
                                Text(expense.amount, format: .currency(code: "EUR"))
                            }
                        }
                    }.onDelete(perform: expenseManager.removeExpense)
                    
                }
                
                
                
            }.navigationTitle("iExpense")
                .toolbar{
                    Button("Add Expense", systemImage: "plus"){
                        
                        showingAddExpenseView = true
                        /*
                        let expense = Expense(name: "Test", type: "Personal", amount: 10.0)
                        
                        expenseManager.expenses.append(expense)
                         */
                        
                        
                    }
                }
                .sheet(isPresented: $showingAddExpenseView){
                    AddExpenseView(expenseManager: expenseManager)
                }
            
            
        }
    }
    
}


#Preview {
    ContentView()
}
