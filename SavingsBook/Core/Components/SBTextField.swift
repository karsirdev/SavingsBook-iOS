//
//  SBTextField.swift
//  SavingsBook
//
//  Created by Nguyen on 10/6/26.
//

import SwiftUI

struct SBTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var icon: String? = nil

    var body: some View {
        HStack(spacing: 10) {
            if let icon {
                Image(systemName: icon)
                    .foregroundStyle(Color.SBTextSecondary)
            }
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .font(.SBBody)
        .padding(.horizontal, 14)
        .frame(height: 50)
        .background(Color.SBSurface)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    @Previewable @State var text = ""
    SBTextField(placeholder: "Email / Số điện thoại",
                text: $text,
                icon: "envelope")
        .padding()
}
