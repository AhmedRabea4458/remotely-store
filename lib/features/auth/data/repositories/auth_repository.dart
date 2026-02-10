import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  Future<UserModel?> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  Future<UserModel?> register(String email,String phone, String password) {
    return remoteDataSource.register(email,phone, password);
  }

  Future<void> logout() {
    return remoteDataSource.logout();
  }

  Stream<UserModel?> authStateChanges() {
    return remoteDataSource.authStateChanges();
  }
  Future<UserModel?> signInWithGoogle() {
    return remoteDataSource.signInWithGoogle();
  }
  Future<UserModel?> signInWithFacebook()  {
    return remoteDataSource.signInWithFacebook();
  }
}
