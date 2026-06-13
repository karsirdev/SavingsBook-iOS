//
//  AuthViewModel.swift
//  SavingsBook
//
//  Created by Nguyen on 9/6/26.
//

import Foundation
import Observation

@Observable
class AuthViewModel {
    
    var email = ""
    var password = ""
    var fullName = ""
    var phone = ""
    var confirmPassword = ""
    var isLoading = false
    var errorMessage: String? = nil
    
    var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }
    
    var isPasswordValid: Bool {
        password.count >= 8
    }
    
    var isLoginFormValid: Bool {
        !email.isEmpty && !password.isEmpty && isEmailValid
    }
    
    var isRegisterFormValid: Bool {
        !fullName.isEmpty &&
        !email.isEmpty &&
        !password.isEmpty &&
        isEmailValid &&
        isPasswordValid &&
        password == confirmPassword
    }
    
    func login() {
        guard isLoginFormValid else {
            errorMessage = "Vui lòng kiểm tra lại thông tin"
            return
        }
        isLoading = true
        print("Đăng nhập với \(email)")
    }
    func register() {
        guard isRegisterFormValid else {
            errorMessage = "Vui lòng kiểm tra lại thông tin"
            return
        }
        isLoading = true
        print("Đăng ký với \(email)")
    }
    
    func clearError() {
        errorMessage = nil
    }
}
