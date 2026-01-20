import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import '../failures/failure.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
    String name,
    String role,
  ) {
    return repository.register(email, password, name, role);
  }
}
