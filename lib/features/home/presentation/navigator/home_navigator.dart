import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/app/navigator/navigator.dart';
import 'package:snapdwell/features/home/presentation/view/pagination_view.dart';

final homeViewNavigatorProvider =
    Provider<HomeViewNavigator>((ref) => HomeViewNavigator());

class HomeViewNavigator {}

mixin HomeViewRoute {
  void openHomeView() {
    NavigateRoute.pushRoute(const HomeView());
  }
}
