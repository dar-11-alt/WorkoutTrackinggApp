import 'package:dartz/dartz.dart';

import '../../user/datasources/user_remote_data_source.dart';
import '../../user/models/user_model.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../core/errors/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> registerUser({
    required String email,
    required String password,
    required String displayName,
    required String role,
  }) async {
    try {
      final UserModel user = await remoteDataSource.registerUser(
        email: email,
        password: password,
        displayName: displayName,
        role: role,
      );
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserModel user = await remoteDataSource.loginUser(
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(String uid) async {
    try {
      final UserModel user = await remoteDataSource.getUserProfile(uid);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(
    UserEntity user,
  ) async {
    try {
      final UserModel updatedUser = await remoteDataSource.updateUserProfile(
        user as UserModel,
      );
      return Right(updatedUser);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
