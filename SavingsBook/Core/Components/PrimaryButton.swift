//
//  PrimaryButton.swift
//  SavingsBook
//
//  Created by Nguyen on 10/6/26.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isLoading: Bool = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .tint(Color.SBOnPrimary)
                }
                Text(title)
                    .font( .SBButton)
                    .foregroundStyle(Color.SBOnPrimary)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(.sbPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .disabled(isLoading)
    }
}

#Preview {
    PrimaryButton(title: "Đăng Nhập") { }
        .padding()
}
