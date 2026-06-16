//
//  VerificationView.swift
//  SavingsBook
//
//  Created by Nguyen on 9/6/26.
//

import SwiftUI

struct VerificationView: View {
    
    @Environment(AuthViewModel.self) private var authVM
    @Environment(\.dismiss) private var dismiss
    
    let email: String
    
    // 6 ô OTP riêng biệt
    @State private var otpDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    
    var body: some View {
        @Bindable var vm = authVM
        
        VStack(spacing: 0) {
            
            // MARK: - Header
            VStack(spacing: 12) {
                Image(systemName: "envelope.badge.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(Color.SBPrimary)
                    .padding(.bottom, 8)
                
                Text("Xác minh email")
                    .font(.SBTitle)
                
                Text("Nhập mã 6 chữ số đã gửi đến\n**\(email)**")
                    .font(.SBBody)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 48)
            .padding(.bottom, 40)
            
            // MARK: - OTP Input
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    OTPDigitField(
                        digit: $otpDigits[index],
                        isFocused: focusedIndex == index
                    )
                    .focused($focusedIndex, equals: index)
                    .onChange(of: otpDigits[index]) { _, newValue in
                        handleInput(newValue, at: index)
                    }
                }
            }
            .padding(.horizontal, 24)
            
            // MARK: - Error
            if let error = authVM.errorMessage {
                Text(error)
                    .font(.SBCaption)
                    .foregroundStyle(.red)
                    .padding(.top, 12)
                    .transition(.opacity)
            }
            
            Spacer()
            
            // MARK: - Verify Button
            Button {
                authVM.verifyOTP()
            } label: {
                Group {
                    if authVM.isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Xác minh")
                            .font(.SBButton)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color.SBPrimary)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .disabled(otpDigits.joined().count < 6 || authVM.isLoading)
            .opacity(otpDigits.joined().count < 6 ? 0.5 : 1)
            .padding(.horizontal, 24)
            
            // MARK: - Resend
            Button {
                authVM.resendOTP()
                otpDigits = Array(repeating: "", count: 6)
                focusedIndex = 0
            } label: {
                if authVM.canResend {
                    Text("Gửi lại mã")
                        .foregroundStyle(Color.SBPrimary)
                } else {
                    Text("Gửi lại sau **\(authVM.countdown)s**")
                        .foregroundStyle(.secondary)
                }
            }
            .disabled(!authVM.canResend)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.SBPrimary)
                }
            }
        }
        .onAppear {
            focusedIndex = 0
        }
        // Navigate sang Home khi xác minh thành công
        .onChange(of: authVM.isAuthenticated) { _, verified in
            if verified {
                // Handle navigation ở ContentView hoặc NavigationStack root
            }
        }
        .animation(.easeInOut(duration: 0.2), value: authVM.errorMessage)
    }
    
    // MARK: - Input Logic
    private func handleInput(_ value: String, at index: Int) {
        // Chỉ giữ 1 ký tự số
        let filtered = value.filter { $0.isNumber }.prefix(1)
        otpDigits[index] = String(filtered)
        
        // Sync về authVM
        authVM.verificationCode = otpDigits.joined()
        
        if !filtered.isEmpty {
            // Tự động nhảy sang ô tiếp theo
            if index < 5 {
                focusedIndex = index + 1
            } else {
                focusedIndex = nil // Ẩn keyboard khi điền xong
            }
        }
    }
}

// MARK: - OTP Digit Field Component
struct OTPDigitField: View {
    @Binding var digit: String
    let isFocused: Bool
    
    var body: some View {
        TextField("", text: $digit)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .frame(width: 48, height: 56)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isFocused ? Color.SBPrimary : Color(.systemGray4),
                        lineWidth: isFocused ? 2 : 1
                    )
            )
            .animation(.easeInOut(duration: 0.15), value: isFocused)
    }
}
#Preview {
    NavigationStack {
        VerificationView(email: "test@gmail.com")
            .environment(AuthViewModel())
    }
}
