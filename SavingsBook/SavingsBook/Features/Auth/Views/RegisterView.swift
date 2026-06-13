//
//  RegisterView.swift
//  SavingsBook
//
//  Created by Nguyen on 9/6/26.
//

import SwiftUI

struct RegisterView: View {
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State private var navigateToLogin = false
    @State private var viewModel = AuthViewModel()
    var body: some View {
        ZStack {
            Color.SBBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Tạo tài khoản")
                            .font(.SBTitle)
                            .foregroundStyle(Color.SBTextPrimary)
                        Text("Bắt đầu quản lí tiết kiệm ngay")
                            .font(.SBCaption)
                            .foregroundStyle(Color.SBTextSecondary)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 28)
                    
                    VStack(spacing: 14) {
                        SBTextField(
                            placeholder: "Họ và tên",
                            text: $viewModel.fullName,
                            icon: "person"
                        )
                        
                        SBTextField(
                            placeholder: "Email",
                            text: $viewModel.email,
                            icon: "envelope"
                        )
                        
                        SBTextField(
                            placeholder: "Số điện thoại",
                            text: $viewModel.phone,
                            icon: "phone"
                        )
                        
                        PasswordField(
                            placeholder: "Mật khẩu",
                            text: $viewModel.password,
                            isVisible: $isPasswordVisible
                        )
                        
                        PasswordField(
                            placeholder: "Nhập lại mật khẩu",
                            text: $viewModel.confirmPassword,
                            isVisible: $isConfirmPasswordVisible
                       )
                    }
                    .padding(.horizontal, 24)
                    
                    VStack(spacing: 16){
                        PrimaryButton(
                            title: "Đăng ký",
                            action: {
                                viewModel.register()
                                navigateToLogin = true
                            },
                            isLoading: viewModel.isLoading
                        )
                        .navigationDestination(isPresented: $navigateToLogin) { LoginView() }
                        
                        HStack(spacing: 4) {
                            Text("Đã có tài khoản?")
                                .font(.SBCaption)
                                .foregroundStyle(Color.SBTextSecondary)
                            NavigationLink(destination: LoginView()) {
                                Text("Đăng nhập")
                                    .font(.SBCaption)
                                    .foregroundStyle(Color.SBPrimary)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 28)
                    .padding(.bottom, 48)
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
    struct PasswordField: View {
        let placeholder: String
        @Binding var text: String
        @Binding var isVisible: Bool
        
        var body: some View {
            HStack(spacing: 10) {
                Image(systemName: "lock")
                    .foregroundStyle(Color.SBTextSecondary)
                
                if isVisible {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
                
                Button{
                    isVisible.toggle()
                } label: {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                        .foregroundColor(Color.SBTextSecondary)
                }
            }
            .font(.SBBody)
            .padding(.horizontal, 14)
            .frame(height: 50)
            .background(Color.SBSurface)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
#Preview {
    NavigationStack {
        RegisterView()
    }
}
