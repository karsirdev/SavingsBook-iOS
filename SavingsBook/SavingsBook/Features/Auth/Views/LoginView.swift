//
//  LoginView.swift
//  SavingsBook
//
//  Created by Nguyen on 9/6/26.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisibe = false
    @State private var viewModel = AuthViewModel()
    var body: some View {
        ZStack {
            Color .sbBackground
                .ignoresSafeArea()
            ScrollView {
                VStack (alignment: .leading, spacing: 0) {
                    
                    HStack {
                        Spacer()
                        VStack(spacing: 7){
                            Image("LightIcon")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            Text("Chào mừng trở lại")
                                .font(.SBTitle)
                                .foregroundStyle(Color.SBTextPrimary)
                            Text("Đăng nhập để tiếp tục")
                                .font(.SBCaption)
                                .foregroundStyle(Color.SBTextSecondary)
                        }
                        Spacer()
                    }
                    .padding(.top, 48)
                    .padding(.bottom, 36)
                    
                    VStack(spacing: 8) {
                        SBTextField(
                            placeholder: "Email / Số điện thoại",
                            text: $viewModel.email,
                            icon: "envelope"
                        )
                        
                        HStack(spacing: 10) {
                            Image(systemName: "lock")
                                .foregroundStyle(Color.SBTextSecondary)
                            
                            if isPasswordVisibe {
                                TextField("Mật khẩu", text: $viewModel.password)
                            } else {
                                SecureField("Mật khẩu", text: $viewModel.password)
                            }
                            
                            Button {
                                isPasswordVisibe.toggle()
                            } label: {
                                Image(systemName: isPasswordVisibe ? "eye.slash" : "eye")
                                        .foregroundStyle(Color.SBTextSecondary)
                            }
                        }
                        .font(.SBBody)
                        .padding(.horizontal, 14)
                        .frame(height: 50)
                        .background(Color .SBSurface)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        
                        HStack {
                            Spacer()
                            Button("Quên mật khẩu"){ }
                                .font(.SBCaption)
                                .foregroundStyle(Color.SBPrimary)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    VStack(spacing: 16) {
                        PrimaryButton(
                            title: "Đăng Nhập",
                            action: { viewModel.login() },
                            isLoading: viewModel.isLoading
                        )
                            .padding(.horizontal, 24)
                        
                        HStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(Color .SBTextSecondary.opacity(0.3))
                            Text("Hoặc")
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(Color .SBTextSecondary.opacity(0.3))
                        }
                        .padding(.horizontal, 24)
                        
                        VStack(spacing: 10) {
                            SocialButton(icon: "g.circle.fill", title: "Tiếp tục với Google")
                            SocialButton(icon: "apple.logo", title: "Tiếp tục với Apple")
                        }
                        .padding(.horizontal,24)
                        
                        HStack(spacing: 4) {
                            Text("Chưa có tài khoản?")
                                .font(.SBCaption)
                                .foregroundStyle(Color.SBTextSecondary)
                            NavigationLink(destination: RegisterView()) {
                                Text("Đăng kí")
                                    .font(.SBCaption)
                                    .foregroundStyle(Color.sbPrimary)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 48)
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
    
    struct SocialButton: View {
        let icon: String
        let title: String
        var body: some View {
            Button { } label: {
                HStack(spacing: 10) {
                    Image(systemName: icon)
                        .font(.system(size: 18))
                    Text(title)
                        .font(.SBBody)
                }
                .foregroundStyle(Color.SBTextPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.SBSurface)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
#Preview {
    NavigationStack {
        LoginView()
    }
}
