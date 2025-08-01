#  Fundraising Portal App

A modern Flutter application designed to help interns and fundraisers track donations, compete on leaderboards, and stay updated with announcements.

## ✨ Features

### 🔐 Authentication
- **Login/Sign-Up Screen** - Clean, responsive authentication interface
- **Form Validation** - Email format and password strength validation
- **Toggle Mode** - Switch between login and signup seamlessly

### 📊 Dashboard
- **Personal Stats** - Total donations raised and donation count
- **Referral Code** - Shareable referral code with copy functionality
- **Rewards System** - Badge-based gamification (Bronze, Silver, Gold, Platinum, Diamond, Master)
- **Recent Donations** - List of recent contributions with donor details

### 🏆 Leaderboard
- **Top Fundraisers** - Monthly rankings with donation amounts
- **Visual Rankings** - Color-coded badges for 1st, 2nd, 3rd place
- **Current User Highlight** - Special highlighting for logged-in user
- **Responsive Design** - Optimized for all screen sizes

###  Announcements
- **Categorized Messages** - Success, Challenge, Reward, Update, Goal, Community types
- **Read/Unread States** - Visual indicators for new messages
- **Time Stamps** - Relative time display (2 hours ago, 1 day ago, etc.)
- **Interactive Elements** - Tap to open announcements

### 🏠 Home Screen
- **Tabbed Navigation** - Seamless switching between Dashboard, Leaderboard, and Announcements
- **Dynamic Title** - Changes based on active tab
- **Clean UI** - Minimalist design with consistent theming

## ️ Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: Clean separation of concerns
- **State Management**: Stateless widgets for optimal performance
- **UI**: Material Design with custom theming

## 📱 Screenshots


### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/fundraising-portal.git
   cd fundraising-portal
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── auth_screen.dart         # Login/Signup screen
├── dashboard_screen.dart    # Dashboard with stats and rewards
├── leaderboard_screen.dart  # Leaderboard with rankings
├── announcements_screen.dart # Announcements and notifications
└── home_screen.dart        # Main tabbed interface
```

##  Design Features

- **Responsive Design** - Adapts to different screen sizes
- **Consistent Theming** - Purple gradient theme throughout
- **Performance Optimized** - No heavy computations or animations
- **Clean Architecture** - Separated concerns and reusable components
- **Accessibility** - Proper contrast and readable fonts

##  Customization

### Colors
- Primary: `#667eea` (Purple)
- Secondary: `#764ba2` (Dark Purple)
- Success: `#4CAF50` (Green)
- Warning: `#FF9800` (Orange)

### Adding New Features
1. Create new screen file in `lib/`
2. Import in `home_screen.dart`
3. Add tab in TabBar
4. Add screen in TabBarView

## 📊 Performance

- **Fast Startup** - No heavy initialization
- **Memory Efficient** - Proper disposal of controllers
- **Smooth Navigation** - Optimized tab switching
- **Responsive UI** - Efficient rendering


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

