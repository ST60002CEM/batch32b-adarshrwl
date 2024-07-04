import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/app/constants/api_endpoints.dart';
import 'package:snapdwell/core/failure/post_failure.dart';
import 'package:snapdwell/core/networking/remote/http_service.dart';
import 'package:snapdwell/features/home/data/dto/get_post_dto.dart';
import 'package:snapdwell/features/home/domain/entity/get_post_entity.dart';


final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return PostRemoteDataSource(dio);
});

class PostRemoteDataSource {
  final Dio _dio;
  PostRemoteDataSource(this._dio);
  Future<Either<PostFailure, List<GetPostEntity>>> getAllPosts(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.pagination,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      // final data = response.data as List;
      if (response.statusCode == 201) {
        final getAllPostDto = GetPostDto.fromJson(response.data);
        final posts = getAllPostDto.data.map((e) => e.toEntity()).toList();
        return Right(posts);
      } else {
        return const Left(
          PostFailure(
            message: 'Post Failed to achieved',
          ),
        );
      }
      // final posts = data.map((e) => Posts.fromJson(e)).toList();
      // return Right(posts);
    } on DioException catch (e) {
      return Left(PostFailure(message: e.message.toString()));
    }
  }


}
