import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Login with email and password
  Future<UserModel?> login(String email, String password);

  /// Create new account with email and password
  Future<UserModel?> register(String email,String phone, String password);

  /// Logout current user
  Future<void> logout();

  /// Listen to authentication state changes
  Stream<UserModel?> authStateChanges();

  /// Sign in using Google account
  Future<UserModel?> signInWithGoogle();

  /// Sign in using Facebook account
  Future<UserModel?> signInWithFacebook();

}

