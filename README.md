<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:F5A725,100:FFF0B0&height=140&section=header&text=SavingsBook&fontSize=48&fontColor=FFFFFF&fontAlignY=45&desc=Personal%20Savings%20Tracker%20for%20iOS&descAlignY=68&descSize=16&descColor=FFFFFF" width="100%"/>

<br/>

[![Swift](https://img.shields.io/badge/Swift-5.9-F05138?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-0071C5?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![iOS](https://img.shields.io/badge/iOS-17.0+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![Xcode](https://img.shields.io/badge/Xcode-16-147EFB?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![Status](https://img.shields.io/badge/Status-In%20Development-F5A725?style=for-the-badge)]()

<br/>

> *Ứng dụng quản lý tài chính cá nhân toàn diện — theo dõi tiết kiệm, chi tiêu, khoản vay và số dư ngân hàng trong một nơi duy nhất.*
>
> *A comprehensive personal finance app — savings goals, expense tracking, loan management, and bank integration in one place.*

</div>

---

## 📱 Screenshots

### Light Mode
| Welcome | Login | Register |
|:---:|:---:|:---:|
| <img src="Screenshots/WELCOME - LIGHT.png" width="180"/> | <img src="Screenshots/LOGIN LIGHT - iOS.png" width="180"/> | <img src="Screenshots/register-light.png" width="180"/> |

### Dark Mode
| Welcome | Login |
|:---:|:---:|
| <img src="Screenshots/WELCOME - DARK.png" width="180"/> | <img src="Screenshots/LOGIN DARK - iOS.png" width="180"/> |

---

## 💡 About / Giới thiệu

**SavingsBook** là ứng dụng quản lý tài chính cá nhân được thiết kế để giúp người dùng nắm rõ toàn bộ bức tranh tài chính của mình — từ các khoản tiết kiệm ngân hàng, mục tiêu tiết kiệm cá nhân, đến chi tiêu hàng ngày và các khoản vay đang có.

Thay vì phải mở nhiều app ngân hàng khác nhau hoặc ghi chép thủ công, SavingsBook tập hợp tất cả vào một nơi duy nhất, trực quan và dễ sử dụng.

---

## ✨ Features / Tính năng

### 🏦 Tiết kiệm ngân hàng
- Liên kết với tài khoản ngân hàng để theo dõi các khoản tiết kiệm đang gửi
- Xem số dư, kỳ hạn, lãi suất của từng khoản tiết kiệm
- Theo dõi lãi suất các ngân hàng hàng tháng để so sánh và lựa chọn

### 🎯 Mục tiêu tiết kiệm cá nhân
- Tự tạo mục tiêu tiết kiệm cá nhân (du lịch, mua điện thoại, học phí...)
- Đặt số tiền mục tiêu và thời hạn hoàn thành
- Theo dõi tiến trình bằng biểu đồ trực quan
- Nhận thông báo nhắc nhở nạp tiền định kỳ

### 💳 Quản lý số dư ngân hàng
- Xem số dư tất cả tài khoản ngân hàng đã liên kết trong một màn hình
- Cập nhật số dư theo thời gian thực

### 💸 Quản lý thu chi hàng ngày
- Ghi lại thu nhập và chi tiêu trong ngày
- Phân loại chi tiêu theo danh mục (ăn uống, di chuyển, mua sắm...)
- Xem tổng quan chi tiêu trong ngày / tuần / tháng
- Lịch sử chi tiêu chi tiết theo thời gian

### 📊 Khoản vay
- Theo dõi các khoản vay đang có
- Xem thời hạn còn lại, số tiền lãi và gốc còn phải trả
- Lịch trả nợ hàng tháng

---

## 🗺 Roadmap

**v0.1 — Auth (Đang làm)**
- [x] Welcome screen với gradient design
- [x] Dual-theme system — Light (vàng) & Dark (tím)
- [x] Login screen
- [x] Register screen

**v0.2 — Home & Savings Goals**
- [ ] Màn hình Home — tổng quan tài chính
- [ ] Tạo / sửa / xoá mục tiêu tiết kiệm cá nhân
- [ ] Biểu đồ tiến trình mục tiêu
- [ ] Local storage với SwiftData

**v0.3 — Expense Tracking**
- [ ] Ghi thu chi hàng ngày
- [ ] Phân loại chi tiêu theo danh mục
- [ ] Lịch sử chi tiêu
- [ ] Báo cáo tuần / tháng

**v0.4 — Bank Integration**
- [ ] Liên kết tài khoản ngân hàng
- [ ] Xem số dư các ngân hàng
- [ ] Theo dõi lãi suất tiết kiệm
- [ ] Đồng bộ khoản tiết kiệm ngân hàng

**v0.5 — Loan Management**
- [ ] Quản lý khoản vay
- [ ] Lịch trả nợ hàng tháng
- [ ] Thông báo nhắc trả nợ

---

## 🏗 Architecture

Dự án sử dụng **MVVM (Model — View — ViewModel)** pattern, tách bạch rõ từng tầng để dễ maintain và mở rộng.

```
SavingsBook/
├── App/                        # Entry point
│   ├── SavingsBookApp.swift
│   └── ContentView.swift
│
├── Features/                   # Mỗi feature một folder riêng
│   ├── Auth/
│   │   ├── Views/              # WelcomeView, LoginView, RegisterView
│   │   └── ViewModels/         # AuthViewModel
│   ├── Home/
│   │   ├── Views/
│   │   └── ViewModels/
│   ├── Savings/
│   │   ├── Views/              # SavingGoalList, AddGoal, GoalDetail
│   │   └── ViewModels/
│   ├── Expenses/
│   │   ├── Views/              # DailyExpense, History, Report
│   │   └── ViewModels/
│   ├── Bank/
│   │   ├── Views/              # LinkedBanks, Balance, InterestRate
│   │   └── ViewModels/
│   └── Loans/
│       ├── Views/              # LoanList, LoanDetail, Schedule
│       └── ViewModels/
│
├── Data/                       # Tầng dữ liệu
│   ├── Models/                 # User, SavingGoal, Expense, Loan, Bank
│   ├── Repositories/
│   └── Persistence/            # SwiftData container
│
├── Core/                       # Dùng chung toàn app
│   ├── Components/             # PrimaryButton, SBTextField
│   ├── Theme/                  # Color+App, Font+App
│   ├── Utils/                  # DateFormatter, CurrencyFormatter
│   └── Extensions/
│
└── Resources/
    ├── Assets.xcassets
    └── Localizable.strings
```

---

## 🎨 Design System

Thiết kế trên **Figma** với dual-theme system:

| Token | Light | Dark |
|---|---|---|
| `SBPrimary` | `#F5A725` | `#7B5FD4` |
| `SBBackground` | `#FFF8ED` | `#120D31` |
| `SBSurface` | `#FFFFFF` | `#2D1B69` |
| `SBTextPrimary` | `#1A1A1A` | `#F0F0F0` |
| `SBTextSecondary` | `#666666` | `#A89FD0` |
| `SBError` | `#E53E3E` | `#FC8181` |

🔗 [View Figma Design](https://www.figma.com/design/k1F530QapnCf7Mpf6yPw6A/SavingsBook)

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift 5.9 |
| UI Framework | SwiftUI |
| Architecture | MVVM |
| Local Storage | SwiftData |
| Design | Figma |
| Min iOS | iOS 17.0 |
| IDE | Xcode 16 |

---

## 🚀 Getting Started

### Requirements / Yêu cầu

- macOS 14.0+
- Xcode 16.0+
- iOS 17.0+ (simulator hoặc device thật)

### Installation / Cài đặt

```bash
# 1. Clone repo
git clone https://github.com/karsirdev/SavingsBook-iOS.git

# 2. Mở project
cd SavingsBook-iOS
open SavingsBook.xcodeproj

# 3. Chọn simulator hoặc device, nhấn Run (⌘R)
```

> Không cần cài thêm dependencies — project chỉ dùng native Apple frameworks.

---

## 📋 Commit Convention

Dự án theo [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(auth): add login screen with email and password
fix(home): correct savings total calculation
style(theme): update primary color to match Figma
refactor(auth): extract form validation to AuthViewModel
chore(deps): update SwiftData schema
```

| Type | Ý nghĩa |
|---|---|
| `feat` | Tính năng mới |
| `fix` | Sửa bug |
| `style` | Thay đổi UI, màu sắc |
| `refactor` | Cải thiện code, không đổi chức năng |
| `chore` | Cấu hình, dependencies |

---

## 👨‍💻 Author

<div align="center">

**Vũ Cao Nguyên**

*First-year Mobile Engineering student · Ho Chi Minh City*

[![GitHub](https://img.shields.io/badge/GitHub-karsirdev-181717?style=flat-square&logo=github)](https://github.com/karsirdev)
[![Email](https://img.shields.io/badge/Email-nguyencaovu2007@gmail.com-EA4335?style=flat-square&logo=gmail&logoColor=white)](mailto:nguyencaovu2007@gmail.com)

</div>

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:FFF0B0,100:F5A725&height=100&section=footer" width="100%"/>

</div>
