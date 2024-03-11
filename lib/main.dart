import 'package:azn_hollyfood_flutter_app/controllers/user_controller.dart';
import 'package:azn_hollyfood_flutter_app/providers/gsheets_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:azn_hollyfood_flutter_app/configuration/firebase_options.dart';
import 'package:azn_hollyfood_flutter_app/services/database_services.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:azn_hollyfood_flutter_app/screens/index.dart';
import 'package:azn_hollyfood_flutter_app/providers/theme_provider.dart';
import 'package:azn_hollyfood_flutter_app/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'package:azn_hollyfood_flutter_app/utils/theme_data.dart';
import 'package:azn_hollyfood_flutter_app/screens/products/table.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  )
      .then((_) => Log.debug('Firebase initialized'))
      .then((_) async => await dotenv.load())
      .then((_) => _setup())
      .then((value) => runApp(const MyApp()))
      .catchError((error) => Log.error('Error initializing App: $error'));
}

void _setup() {
  GetIt.I.registerSingleton<NavigationService>(NavigationService());
  GetIt.instance.registerLazySingleton(() => FirebaseFirestore.instance);
  GetIt.I
      .registerLazySingleton(() => UserController(db: GetIt.I<FirebaseFirestore>()));

  GetIt.I.registerSingleton<DataBaseService>(DataBaseService());
  Log.debug('DataBaseService initialized');
  if (dotenv.env.isEmpty) {
    throw Exception('No .env file found or empty');
  }
  Log.debug('loading credintial from .env');

  final Map<String, String> credintial = {
    ...CREDINTIAL_PRIVATE_KETS.map((key, value) {
      if (value.isEmpty) {
        throw Exception('The value of $key is empty');
      } else {
        return MapEntry(key, dotenv.env[value]!);
      }
    }),
    ...CREDINTAL_KEYS
  };

  final String sheetId = dotenv.env[SPREADSHEET_ID]!;
  Log.debug('credintial loaded and sheetId loaded');

  GetIt.I.registerSingleton<GSheetsProvider>(GSheetsProvider(
    sheetId: sheetId,
    credintial: credintial,
  ));
  GetIt.I.registerSingleton<AuthenticationProvider>(AuthenticationProvider());
  Log.debug('GSheetsProvider initialized');
  GetIt.I.registerSingleton<ThemeProvider>(ThemeProvider());
  Log.debug('ThemeProvider initialized');
  Log.debug('App setup completed');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Size screenSize;
  static final Map<Routes, Widget> _rootToWidget = {
    Routes.initialRoute:
        const WelcomeScreen(title: APP_NAME, welcomeMessage: WELCOME_TEXT),
    Routes.login: const LoginScreen(),
    Routes.home: const HomeScreen(),
    Routes.adminLogin: const AdminLoginScreen(),
    Routes.adminPanel: const AdminPanel(),
    Routes.manageAppLogin: const AppManagerLoginScreen(),
    Routes.manageApp: const ManageApp(),
    Routes.usersTable: const UsersTable(),
    Routes.sales: const SalesScreen(),
    Routes.makeSales: const ProductsTable(title: 'ביצוע מכירה'),
    // Routes.salesAnalysis: SalesAnalysisScreen(),
    // Routes.purchase: PurchasesScreen(title: 'רכישות', onSelect: (dynamic product) {}),
    Routes.purchase: const ProductsTable(title: 'רכישה'),
    Routes.productsTable: const ProductsTable(title: 'מוצרים'),
    Routes.error: const ErrorScreen(),
  };

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    // init providers for the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: APP_NAME,
            navigatorKey: NavigationService.navigatorKey,
            // theme: Styles.themeData(isDarkMode: themeProvider.isDarkMode, context: context),
            theme: themeProvider.isDarkMode ? darkMode : lightMode,
            home: _rootToWidget[Routes.initialRoute]!,
            initialRoute: Routes.initialRoute.url,
            onGenerateRoute: (RouteSettings settings) {
              final route = settings.name;
              final routeToEnum =
                  _rootToWidget.keys.firstWhere((key) => key.url == route);
              Log.info('routeToEnum: $routeToEnum');
              final widget =
                  _rootToWidget[routeToEnum] ?? _rootToWidget[Routes.error];
              return MyCustomRoute(
                builder: (_) => widget!,
                settings: settings,
              );
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const ErrorScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {required super.builder, required RouteSettings super.settings});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Log.debug('settings.name: ${settings.name}');
    if (settings.name == Routes.initialRoute.url) {
      return child;
    }

    return FadeTransition(opacity: animation, child: child);
  }
}
