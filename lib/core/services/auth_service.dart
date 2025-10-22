// services/auth_service.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiplayer_tic_tac_toe_app/models/user_model.dart';

final authServiceProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  // Email Authentication
  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _updateUserData(credential.user!);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<UserCredential?> signUpWithEmail(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(displayName);
      await _createUserDocument(credential.user!, displayName);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Google Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      await _updateUserData(userCredential.user!);
      return userCredential;
    } catch (e) {
      throw 'Google sign in failed: $e';
    }
  }

  // Facebook Authentication
  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        await _updateUserData(userCredential.user!);
        return userCredential;
      } else if (result.status == LoginStatus.cancelled) {
        return null; // User cancelled
      } else {
        throw 'Facebook login failed: ${result.message}';
      }
    } catch (e) {
      throw 'Facebook sign in failed: $e';
    }
  }

  // Sign Out - Fixed version
  Future<void> signOut() async {
    try {
      // Sign out from Firebase first
      await _auth.signOut();

      // Then try to sign out from Google (safely)
      try {
        if (_googleSignIn.currentUser != null) {
          await _googleSignIn.signOut();
        }
      } catch (e) {
        // Ignore Google sign out errors in development
        if (kDebugMode) {
          print('Google sign out error (can be ignored): $e');
        }
      }

      // Then try to sign out from Facebook (safely)
      try {
        await FacebookAuth.instance.logOut();
      } catch (e) {
        // Ignore Facebook logout errors if plugin not properly configured
        if (kDebugMode) {
          print('Facebook logout error (can be ignored): $e');
        }
      }
    } catch (e) {
      // If there's any error in the main sign out, still try to sign out from Firebase
      await _auth.signOut();
      rethrow;
    }
  }

  // Create user document in Firestore
  Future<void> _createUserDocument(User user, String displayName) async {
    final userModel = UserModel.create(
      id: user.uid,
      email: user.email ?? '',
      displayName: displayName,
      photoUrl: user.photoURL,
      wins: 0,
      losses: 0,
      draws: 0,
      createdAt: DateTime.now(),
      lastSeen: DateTime.now(),
    );

    await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
  }

  // Update user data
  Future<void> _updateUserData(User user) async {
    final docRef = _firestore.collection('users').doc(user.uid);
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.update({'lastSeen': DateTime.now().toIso8601String()});
    } else {
      await _createUserDocument(user, user.displayName ?? 'Player');
    }
  }

  // Handle auth exceptions
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Wrong password provided';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}
