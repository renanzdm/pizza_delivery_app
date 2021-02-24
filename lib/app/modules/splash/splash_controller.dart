import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/models/user_logged.dart';
import 'package:pizza_delivery_app/app/modules/home/home_page.dart';
import 'package:pizza_delivery_app/app/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _loggedState = UserLogged.empty.obs;

  UserLogged get loggedState => _loggedState.value;

  @override
  void onInit() {
    super.onInit();
    ever<UserLogged>(_loggedState, _checkIsLogged);

    checkLogin();
  }

  void _checkIsLogged(UserLogged userLogged) async {
    switch (userLogged) {
      case UserLogged.authenticate:
        Get.offAllNamed(HomePage.ROUTE_PAGE);
        break;
      case UserLogged.unauthenticate:
        Get.offAllNamed(LoginPage.ROUTE_PAGE);

        break;
      case UserLogged.empty:
        break;
      default:
    }
  }

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('user')) {
      _loggedState.value = UserLogged.authenticate;
    } else {
      _loggedState.value = UserLogged.unauthenticate;
    }
  }
}
