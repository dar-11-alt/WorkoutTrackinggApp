import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import '../failures/failure.dart';

class UpdateUserProfile {
  final AuthRepository repository;

  UpdateUserProfile(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String name,
    String role,
  ) {
    return repository.updateUserProfile(name, role);
  }
}
