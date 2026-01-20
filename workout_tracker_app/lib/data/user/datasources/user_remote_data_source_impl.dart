import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> registerUser({
    required String email,
    required String password,
    required String displayName,
    required String role,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final userModel = UserModel(
      uid: uid,
      email: email,
      displayName: displayName,
      role: role,
      photoUrl: null,
      createdAt: DateTime.now(),
    );

    await firestore.collection('users').doc(uid).set(userModel.toJson());

    return userModel;
  }

  @override
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    return getUserProfile(uid);
  }

  @override
  Future<UserModel> getUserProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();

    return UserModel.fromJson(doc.data()!, uid);
  }

  @override
  Future<UserModel> updateUserProfile(UserModel user) async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .update(user.toJson());

    return user;
  }
}
