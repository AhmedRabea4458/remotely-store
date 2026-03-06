import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/errors/firebase_errors.dart';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseAuthDataSource({required this.auth, required this.firestore});
  @override
  Future<UserModel?> register(
    String email,
    String phone,
    String password,
  ) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) return null;

      final userModel = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? email,
        phoneNumber: phone,
        name: email.split('@')[0],
      );

      await firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(userModel.toJson());

      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(FirebaseErrorMapper.map(e.code));
      }
      throw Exception("Unexpected error occurred");
    }
  }

  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) return null;

      final userDoc =
          await firestore.collection('users').doc(firebaseUser.uid).get();

      if (!userDoc.exists) {
        throw Exception("User data not found in Firestore");
      }

      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(FirebaseErrorMapper.map(e.code));
      }
      throw Exception("Unexpected error occurred");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(FirebaseErrorMapper.map(e.code));
      }
      throw Exception("Unexpected error occurred");
    }
  }

  @override
  Stream<UserModel?> authStateChanges() {
    return auth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return null;

      return UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName ?? '',
      );
    });
  }

  @override
  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) return null;

      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      final userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(FirebaseErrorMapper.map(e.code));
      }
      throw Exception("Unexpected error occurred");
    }
  }

  Future<UserModel?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) return null;

      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) return null;

      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      final userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );

      if (isNewUser) {
        await firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toJson());
      }

      return userModel;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(FirebaseErrorMapper.map(e.code));
      }
      throw Exception("Unexpected error occurred");
    }
  }
}
