import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/app/navigator/navigator.dart';
import 'package:snapdwell/features/auth/presentation/navigator/register_navigator.dart';
import 'package:snapdwell/features/auth/presentation/view/login_view.dart';
import 'package:snapdwell/features/home/presentation/navigator/home_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, HomeViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginScreen());
  }
}
