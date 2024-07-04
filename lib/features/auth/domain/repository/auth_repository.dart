import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/core/common/internetchecker/internetChecker.dart';

import 'package:snapdwell/core/failure/failure.dart';
import 'package:snapdwell/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:snapdwell/features/auth/data/repository/auth_remote_repository.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final checkConnectivity = ref.read(connectivityStatusProvider);
  if (checkConnectivity == ConnectivityStatus.isConnected) {
    return AuthRemoteRepository(
      ref.read(authRemoteDataSourceProvider),
    );
  } else {
    return AuthRemoteRepository(
      ref.read(authRemoteDataSourceProvider),
    );
  }
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
