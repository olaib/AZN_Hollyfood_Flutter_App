import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';

enum Routes {
  initialRoute,
  error,
  adminLogin,manageAppLogin,login,
  home,
  adminPanel,
  manageApp,
  usersTable,
  authLogout,
  sales, purchase, inventory, employees, production,
  purchases, salesAnalysis,
}
  const Map<Routes, String> _routesMap = {
    Routes.initialRoute: '/',
    Routes.login: '/login',
    Routes.home: '/home',
    Routes.error: '/error',
    Routes.adminPanel: '/adminPanel',
    Routes.adminLogin: '/adminLogin',
    Routes.manageApp: '/manageApp',
    Routes.usersTable: '/usersTable',
    Routes.authLogout: '/authLogout',
    Routes.manageAppLogin: '/manageAppLogin',
    Routes.sales: '/sales',
    Routes.purchase: '/purchase',
    Routes.inventory: '/inventory',
    Routes.employees: '/employees',
    Routes.production: '/production',
    Routes.purchases: '/purchases',
    Routes.salesAnalysis: '/salesAnalysis',
  };

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // get currentRoute => ModalRoute.of(navigatorKey.currentContext!);
  Route<dynamic>? get currentRoute {
    if (navigatorKey.currentContext != null) {
      return ModalRoute.of(navigatorKey.currentContext!);
    } else {
      return MaterialPageRoute(builder: (context) => Container());
    }
  }

  static String get initialRoute => _routesMap[Routes.initialRoute]!;
  Map<Routes, String> get routesMap => _routesMap;
  static String getRoute(Routes route) => _routesMap[route]!;

  Future<dynamic> navigateToWidget(Widget screen) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<dynamic> navigateToRoute(Routes route) {
    Log.info('Navigating to ${_routesMap[route]}');
    return navigatorKey.currentState!
        .pushNamed(_routesMap[route]!)
        .onError((error, stackTrace) => Log.error(error.toString()));
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void removeAndNavigateTo(Routes route) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(_routesMap[route]!, (route) => false);
  }

  Future<dynamic> navigateTo(BuildContext context, Routes route) {
    return Navigator.pushNamed(
        context, NavigationService.getRoute(Routes.home));
  }
}
