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
    
    // MARK: LOGIN && REGISTER
    var email = ""
    var password = ""
    var fullName = ""
    var phone = ""
    var confirmPassword = ""
    var isLoading = false
    var errorMessage: String? = nil
    
    // MARK: VERIFICATION STATE
    var verificationCode = ""
    var canResend = false
    var countdown = 60
    var isVerified = false
    var isAuthenticated = false
    var loginSucceeded = false
    
    private var mockOTPCode = ""
    private var pendingEmail = ""
    private var countdownTask: Task<Void, Never>? = nil
    
    
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
        
        sendVerificationEmail(to: email)
        loginSucceeded = true
        isLoading = false
    }
    
    func register() {
        guard isRegisterFormValid else {
            errorMessage = "Vui lòng kiểm tra lại thông tin"
            return
        }
        isLoading = true
        sendVerificationEmail(to: email)
        print("Đăng ký với \(email)")
    }
    
    func clearError() {
        errorMessage = nil
    }
    
    func sendVerificationEmail(to email: String) {
        pendingEmail = email
        mockOTPCode = generateOTP()
        
        print("[MOCK] Gửi mã OTP về \(email): \(mockOTPCode)")
        
        startCountdown()
    }
    
    func verifyOTP() {
        guard verificationCode.count == 6 else {
            errorMessage = "Vui lòng đủ 6 chữ số"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(1))
            isLoading = false
            
            if verificationCode == mockOTPCode {
                isVerified = true
                isAuthenticated = true
                countdownTask?.cancel()
            } else {
                errorMessage = "Mã xác minh không đúng, thử lại"
                verificationCode = ""
            }
        }
    }
    
    func resendOTP() {
        guard canResend else { return }
        verificationCode = ""
        errorMessage = nil
        sendVerificationEmail(to: pendingEmail)
    }
    
    private func generateOTP() -> String {
        String(format: "%06d", Int.random(in: 0...999999))
    }
    
    private func startCountdown() {
        canResend = false
        countdown = 60
        countdownTask?.cancel()
        
        countdownTask = Task { @MainActor in
            while countdown > 0 {
                try? await Task.sleep(for: .seconds(1))
                if Task.isCancelled { return }
                countdown -= 1
            }
            canResend = true
        }
    }
}
