import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> registerUser({
    required String email,
    required String password,
    required String displayName,
    required String role,
  });

  Future<UserModel> loginUser({
    required String email,
    required String password,
  });

  Future<UserModel> getUserProfile(String uid);

  Future<UserModel> updateUserProfile(UserModel user);
}
