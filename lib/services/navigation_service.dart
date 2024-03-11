import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';

enum Routes {
  initialRoute,
  error,
  adminLogin,
  manageAppLogin,
  login,
  home,
  adminPanel,
  manageApp,
  usersTable,
  authLogout,
  sales,
  purchase,
  inventory,
  employees,
  production,
  purchases,
  salesAnalysis, makeSales, productsTable,
}

extension RoutesExtension on Routes {
  static const Map<Routes, String> _routesMap = {
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
    Routes.makeSales: '/makeSales',
    Routes.productsTable: '/productsTable',
  };
  String get url => _routesMap[this]!;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  String? get currentRoute => ModalRoute.of(navigatorKey.currentState!.context)?.settings.name!;

  void removeAndNavigateTo(Routes route) {
    navigatorKey.currentState!.popAndPushNamed(route.url);
  }

  Future<dynamic> navigateToRoute(Routes route) {
    final nextRoute = route.url;
    Log.info('Navigating to $nextRoute ...');
    return navigatorKey.currentState!
        .pushNamed(nextRoute)
        .onError((error, stackTrace) => Log.error(error.toString()));
  }

  void navigateToPage(Widget page) {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
