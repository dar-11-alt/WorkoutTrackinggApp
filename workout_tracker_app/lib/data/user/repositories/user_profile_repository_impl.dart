import 'package:dartz/dartz.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/user_profile_repository.dart';
import '../../../failures/failure.dart';
import '../datasources/user_profile_remote_data_source.dart';
import '../models/user_model.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;

  UserProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUserProfile({required String uid}) async {
    try {
      final userModel = await remoteDataSource.getUserProfile(uid);
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    try {
      final userModel = await remoteDataSource.updateUserProfile(
        uid: uid,
        name: name,
        email: email,
      );
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
