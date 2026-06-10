<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:F5A725,100:FFF0B0&height=140&section=header&text=SavingsBook&fontSize=48&fontColor=FFFFFF&fontAlignY=45&desc=Personal%20Savings%20Tracker%20for%20iOS&descAlignY=68&descSize=16&descColor=FFFFFF" width="100%"/>

<br/>

[![Swift](https://img.shields.io/badge/Swift-5.9-F05138?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-0071C5?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![iOS](https://img.shields.io/badge/iOS-17.0+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![Xcode](https://img.shields.io/badge/Xcode-16-147EFB?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![Status](https://img.shields.io/badge/Status-In%20Development-F5A725?style=for-the-badge)]()

<br/>

> *Ứng dụng quản lý tiết kiệm cá nhân — đơn giản, đẹp, và thực sự hữu ích.*
>
> *A clean, native iOS app for tracking personal savings goals.*

</div>

---

## 📱 Screenshots

### Light Mode
| Welcome | Login | Register |
|:---:|:---:|:---:|
| <img src="Screenshots/welcome-light.png" width="180"/> | <img src="Screenshots/login-light.png" width="180"/> | <img src="Screenshots/register-light.png" width="180"/> |

### Dark Mode
| Welcome | Login |
|:---:|:---:|
| <img src="Screenshots/welcome-dark.png" width="180"/> | <img src="Screenshots/login-dark.png" width="180"/> |

> 💡 Export ảnh từ Figma → đặt vào folder `Screenshots/` với đúng tên file trên là ảnh tự hiện.

---

## ✨ Features / Tính năng

**Hiện tại (v0.1)**
- [x] Welcome screen với gradient design
- [x] Dual-theme system — Light (vàng) & Dark (tím)
- [x] Login & Register screen
- [ ] Màn hình Home — tổng quan tiết kiệm
- [ ] Thêm / sửa / xoá mục tiêu tiết kiệm
- [ ] Biểu đồ tiến trình
- [ ] Local storage với SwiftData
- [ ] Thông báo nhắc nhở

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
│   └── Savings/
│       ├── Views/
│       └── ViewModels/
│
├── Data/                       # Tầng dữ liệu
│   ├── Models/                 # User, SavingGoal
│   ├── Repositories/           # SavingRepository, AuthRepository
│   └── Persistence/            # SwiftData container
│
├── Core/                       # Dùng chung toàn app
│   ├── Components/             # PrimaryButton, SBTextField
│   ├── Theme/                  # Color+App, Font+App
│   ├── Utils/                  # DateFormatter, CurrencyFormatter
│   └── Extensions/             # View+Extensions, Color+Extensions
│
└── Resources/
    ├── Assets.xcassets          # Color sets, images
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
