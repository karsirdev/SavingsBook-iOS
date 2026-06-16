//
//  SavingsBookApp.swift
//  SavingsBook
//
//  Created by Nguyen on 9/6/26.
//
import SwiftUI


@main
struct SavingsBookApp: App {
    @State private var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authVM)
        }
    }
}
