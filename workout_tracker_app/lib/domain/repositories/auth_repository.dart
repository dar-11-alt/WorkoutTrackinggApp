import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
    String name,
    String role,
  );

  Future<Either<Failure, UserEntity>> getUserProfile();

  Future<Either<Failure, UserEntity>> updateUserProfile(
    String name,
    String role,
  );
}
