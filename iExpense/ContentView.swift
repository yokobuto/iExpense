//
//  ContentView.swift
//  iExpense
//
//  Created by Jörg Klausewitz on 23.12.25.
//

import SwiftUI


struct User {
    
    let firstName = "Bilbo"
    let lastName = "Baggins"
    
    
}

struct ContentView: View {
    
    let user = User()
    
    var body: some View {
        VStack {
            Text(user.firstName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
