import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/core/failure/post_failure.dart';
import 'package:snapdwell/features/home/data/datasource/post_remote_datasource.dart';
import 'package:snapdwell/features/home/domain/entity/get_post_entity.dart';
import 'package:snapdwell/features/home/domain/repository/post_repository.dart';


final postRemoteRepositoryProvider = Provider<IPostRepository>(
  (ref) => PostRemoteRepository(
    postsRemoteDataSource: ref.read(postRemoteDataSourceProvider),
  ),
);

class PostRemoteRepository implements IPostRepository {
  final PostRemoteDataSource postsRemoteDataSource;

  PostRemoteRepository({required this.postsRemoteDataSource});

  @override
  Future<Either<PostFailure, List<GetPostEntity>>> getAllPosts(int page) {
    return postsRemoteDataSource.getAllPosts(page);
  }
}
