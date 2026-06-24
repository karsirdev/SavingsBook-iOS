//
//  AppNavigation.swift
//  SavingsBook
//
//  Created by Vu Cao Nguyen on 23/6/26.
//

import SwiftUI

enum AppRoute: Hashable {
    case welcome
    case login
    case register
    case verification(email: String)
    case home
}

struct AppNavigation: View {
    @Environment(AuthViewModel.self) private var authVM
    var body: some View {
        if authVM.isAuthenticated {
            HomeView()
        } else {
            NavigationStack {
                WelcomeView()
            }
        }
    }
}
