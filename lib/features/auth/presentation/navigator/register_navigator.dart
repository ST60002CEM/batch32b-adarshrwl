import 'package:snapdwell/app/navigator/navigator.dart';
import 'package:snapdwell/features/auth/presentation/view/register_view.dart';

class RegisterViewNavigator {}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const SignUpScreen());
  }
}
