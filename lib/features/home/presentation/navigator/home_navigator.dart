import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/app/navigator/navigator.dart';
import 'package:snapdwell/features/home/presentation/view/home_view.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeNavigator());

class HomeNavigator {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.pushRoute(const HomeView());
  }
}