import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/core/failure/failure.dart';
import 'package:snapdwell/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';
import 'package:snapdwell/features/auth/domain/repository/auth_repository.dart';


final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);


  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    return _authRemoteDataSource.loginStudent(username, password);
  }

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
    return _authRemoteDataSource.registerStudent(student);
  }

  Future<Either<Failure, AuthEntity>> getCurrentUser() {
   return _authRemoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
