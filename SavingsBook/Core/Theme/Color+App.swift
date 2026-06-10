//
//  Color+App.swift
//  SavingsBook
//
//  Created by Nguyen on 10/6/26.
//

import SwiftUI

extension Color {
    // MARK: - Brand
    static let SBPrimary       = Color("SBPrimary")
    static let SBPrimaryDark   = Color("SBPrimaryDark")
    static let SBBackground    = Color("SBBackground")
    static let SBSurface       = Color("SBSurface")
    static let SBOnPrimary     = Color("SBOnPrimary")
    static let SBTextPrimary   = Color("SBTextPrimary")
    static let SBTextSecondary = Color("SBTextSecondary")
    static let SBError         = Color("SBError")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
