import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/core/failure/post_failure.dart';
import 'package:snapdwell/features/home/data/repository/post_remote_repository.dart';
import 'package:snapdwell/features/home/domain/entity/get_post_entity.dart';

final postsRepositoryProvider = Provider<IPostRepository>(
  (ref) => ref.read(postRemoteRepositoryProvider),
);

abstract class IPostRepository {
  Future<Either<PostFailure, List<GetPostEntity>>> getAllPosts(int page);
}
