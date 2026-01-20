import 'package:workout_tracker_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.displayName,
    required super.role,
    required super.photoUrl,
    required super.createdAt,
  });

  /// Convert Firebase → Model
  factory UserModel.fromJson(Map<String, dynamic> json, String uid) {
    return UserModel(
      uid: uid,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      role: json['role'] as String,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// Convert Model → Firebase
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'role': role,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
