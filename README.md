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



![Screenshot_20250802-222349](https://github.com/user-attachments/assets/8c21ddb4-d8ab-409b-af42-e4132515b326)
![Screenshot_20250802-222343](https://github.com/user-attachments/assets/6c74cd12-5037-42f3-adee-b97d11970508)
![Screenshot_20250802-222426](https://github.com/user-attachments/assets/68d2daf0-b542-4fb4-8ed7-470b6d52c372)
![Screenshot_20250802-222418](https://github.com/user-attachments/assets/0d76d886-6152-4c99-bd83-cf80051cae37)
![Screenshot_20250802-222412](https://github.com/user-attachments/assets/9c60a93a-d52b-490b-af95-c3ece24c0b62)

<img src="https://github.com/user-attachments/assets/8c21ddb4-d8ab-409b-af42-e4132515b326" height="200" width="100">
<img src="https://github.com/user-attachments/assets/6c74cd12-5037-42f3-adee-b97d11970508" height="200" width="100">
<img src="https://github.com/user-attachments/assets/68d2daf0-b542-4fb4-8ed7-470b6d52c372" height="200" width="100">
<img src="https://github.com/user-attachments/assets/0d76d886-6152-4c99-bd83-cf80051cae37" height="200" width="100">
<img src="https://github.com/user-attachments/assets/9c60a93a-d52b-490b-af95-c3ece24c0b62" height="200" width="100">
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

