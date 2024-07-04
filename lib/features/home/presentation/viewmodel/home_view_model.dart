import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/features/home/data/datasource/post_remote_datasource.dart';
import 'package:snapdwell/features/home/presentation/navigator/home_navigator.dart';
import 'package:snapdwell/features/home/presentation/state/post_state.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, PostState>((ref) {
  final navigator = ref.read(homeViewNavigatorProvider);
  final postsDataSource = ref.read(postRemoteDataSourceProvider);
  return HomeViewModel(navigator, postsDataSource);
});

class HomeViewModel extends StateNotifier<PostState> {
  HomeViewNavigator navigator;
  final PostRemoteDataSource _postsDataSource;

  HomeViewModel(this.navigator, this._postsDataSource)
      : super(PostState.initial()) {
    getPosts();
  }

  Future resetState() async {
    state = PostState.initial();
    getPosts();
  }

  Future getPosts({int? page}) async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final currentPage = page ??
        currentState.page + 1; // Use provided page or increment current page
    final posts = currentState.lstposts;
    final hasReachedMax = currentState.hasReachedMax;

    if (!hasReachedMax) {
      // get the data from data source
      final result = await _postsDataSource.getAllPosts(currentPage);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              lstposts: [...posts, ...data],
              page: currentPage,
              isLoading: false,
            );
          }
        },
      );
    }
  }

  void openPostPage() {
    // code here
  }
}
