import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Background gradient
                LinearGradient(
                    colors: [
                        Color(hex: "F5A725"),
                        Color(hex: "FFF0B0")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer()

                    // MARK: - Logo
                    VStack(spacing: 20) {
                        Image("AppIcon")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 28))
                            .shadow(color: .black.opacity(0.15), radius: 12, y: 6)

                        Text("SavingsBook")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(Color(hex: "2D1A00"))

                        Text("Quản lí số tiết kiệm thông minh")
                            .font(.SBBody)
                            .foregroundStyle(Color(hex: "2D1A00").opacity(0.7))
                    }

                    Spacer()

                    // MARK: - Buttons
                    VStack(spacing: 14) {
                        NavigationLink(destination: LoginView()) {
                            Text("Đăng Nhập")
                                .font(.SBButton)
                                .foregroundStyle(Color(hex: "F5A725"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color(hex: "2D1A00"))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        }

                        NavigationLink(destination: RegisterView()) {
                            Text("Tạo tài khoản mới")
                                .font(.SBButton)
                                .foregroundStyle(Color(hex: "2D1A00"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color.white.opacity(0.85))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        }

                        Text("Tiếp tục với tư cách khách")
                            .font(.SBCaption)
                            .foregroundStyle(Color(hex: "2D1A00").opacity(0.6))
                            .padding(.top, 4)
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 52)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
