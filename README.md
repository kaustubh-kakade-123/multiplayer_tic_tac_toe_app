Multiplayer Tic-Tac-Toe Flutter App
A comprehensive multiplayer Tic-Tac-Toe game built with Flutter, Riverpod state management, and Firebase backend, following MVVM architecture patterns.
Features
✅ Authentication Service

Google Sign-In
Facebook Authentication
Email/Password Authentication
Automatic user profile creation

✅ Game Service

Real-time multiplayer gameplay
Game state synchronization
Move validation and turn management
Win/Draw detection

✅ Matchmaking Service

Quick match functionality
Ranked matchmaking
Join existing games
Create custom games

✅ Score Service

Player statistics tracking
Win/Loss/Draw records
Win rate calculations
Game history

✅ Leaderboard Service

Global leaderboard (all-time)
Monthly leaderboard
Weekly leaderboard
Player ranking system

Project Structure
lib/
├── main.dart                           # App entry point
├── models/                             # Data models
│   ├── user_model.dart                # User data model
│   ├── game_model.dart                # Game state model
│   ├── move_model.dart                # Move tracking model
│   └── score_model.dart               # Player score model
├── services/                          # Business logic & data
│   ├── auth_service.dart              # Authentication service
│   ├── game_service.dart              # Game logic service
│   ├── matchmaking_service.dart       # Player matching service
│   ├── score_service.dart             # Score management service
│   └── leaderboard_service.dart       # Leaderboard service
└── views/                             # UI layers (MVVM)
    ├── auth/
    │   └── login_view.dart            # Authentication UI
    ├── home/
    │   ├── home_view.dart             # Main navigation
    │   └── matchmaking_view.dart      # Game finding UI
    ├── game/
    │   └── game_view.dart             # Game board UI
    ├── leaderboard/
    │   └── leaderboard_view.dart      # Rankings UI
    └── profile/
        └── profile_view.dart          # User profile UI
Dependencies
Add these dependencies to your pubspec.yaml:
yamldependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  google_sign_in: ^6.1.6
  flutter_facebook_auth: ^6.0.4
  uuid: ^4.2.1
  freezed_annotation: ^2.4.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.7
  freezed: ^2.4.7
  json_annotation: ^4.8.1
  json_serializable: ^6.7.1
Setup Instructions
1. Firebase Setup

Create a new Firebase project at Firebase Console
Enable Authentication with Email/Password, Google, and Facebook providers
Create a Firestore database with these collections:

users - User profiles and statistics
games - Game states and history
moves - Move history (optional for analytics)



2. Android Configuration

Add your Android app to Firebase project
Download google-services.json to android/app/
Update android/build.gradle:

gradledependencies {
    classpath 'com.google.gms:google-services:4.3.15'
}

Update android/app/build.gradle:

gradleapply plugin: 'com.google.gms.google-services'

android {
    compileSdkVersion 34
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
3. iOS Configuration

Add your iOS app to Firebase project
Download GoogleService-Info.plist to ios/Runner/
Update ios/Runner/Info.plist with URL schemes
Update ios/Podfile:

rubyplatform :ios, '12.0'
4. Web Configuration (Optional)

Add your web app to Firebase project
Add Firebase configuration to web/index.html

5. Social Authentication Setup
Google Sign-In

Configure OAuth consent screen in Google Cloud Console
Add your app's SHA-1 fingerprint to Firebase
Enable Google Sign-In in Firebase Authentication

Facebook Authentication

Create Facebook App at Facebook Developers
Add Facebook Login product
Configure OAuth redirect URIs
Add Facebook App ID to Firebase Authentication

Architecture Overview
MVVM Pattern Implementation
Models: Data structures with Freezed for immutability
dart@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String player1Id,
    // ... other properties
  }) = _GameModel;
}
Services: Business logic and data management
dartclass GameService {
  Future<void> makeMove(String gameId, int row, int col) async {
    // Game logic implementation
  }
}
ViewModels: State management with Riverpod
dartfinal gameViewModelProvider = StateNotifierProvider.family<GameViewModel, AsyncValue<String?>, String>((ref, gameId) {
  return GameViewModel(ref.read(gameServiceProvider), gameId);
});
Views: UI components consuming ViewModels
dartclass GameView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(activeGameProvider(gameId));
    // UI implementation
  }
}
Key Features Implementation
Real-time Multiplayer

Uses Firestore real-time listeners
Automatic game state synchronization
Turn-based gameplay with validation

Matchmaking System

Quick match with available players
Skill-based matchmaking (expandable)
Create/join custom games

Comprehensive Statistics

Individual player statistics
Global leaderboards with time periods
Game history tracking
Win rate calculations

Authentication Flow

Multiple sign-in options
Automatic profile creation
Session management
Secure user identification

Database Schema
Users Collection
firestoreusers/{userId}
├── id: string
├── email: string
├── displayName: string
├── photoUrl: string?
├── wins: number
├── losses: number
├── draws: number
├── createdAt: timestamp
└── lastSeen: timestamp
Games Collection
firestoregames/{gameId}
├── id: string
├── player1Id: string
├── player2Id: string?
├── player1Name: string
├── player2Name: string?
├── board: array[3][3]
├── currentTurn: string
├── status: string
├── winnerId: string?
├── createdAt: timestamp
├── completedAt: timestamp?
└── moveCount: number
Running the Application

Clone and setup:

bashflutter pub get
flutter pub run build_runner build

Run on device:

bashflutter run

Build for production:

bashflutter build apk --release  # Android
flutter build ios --release  # iOS
Security Considerations

Firestore security rules for data protection
User authentication required for all game operations
Move validation on both client and server
Rate limiting for API calls

Future Enhancements

 Spectator mode
 Tournament system
 Chat functionality
 Push notifications
 Offline mode
 AI opponents
 Custom game modes (larger boards)
 Friend system
 Replay system

Testing Strategy

Unit tests for game logic
Widget tests for UI components
Integration tests for user flows
Firestore emulator for testing

This implementation provides a solid foundation for a production-ready multiplayer Tic-Tac-Toe application with room for future enhancements and scaling.