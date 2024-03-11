import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:azn_hollyfood_flutter_app/providers/authentication_provider.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:azn_hollyfood_flutter_app/widgets/custom_navbar.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';

class AppManagerLoginScreen extends StatefulWidget {
  const AppManagerLoginScreen({super.key});
  
  @override
  State<AppManagerLoginScreen> createState() => _AppManagerLoginState();
}


class _AppManagerLoginState extends State<AppManagerLoginScreen> {
  late NavigationService _nav;
  late AuthenticationProvider _auth; 
  late Size size;

 Future<String?> _signIn(LoginData data, context) async {
    try{
      await _auth.signInWithEmailAndPassword(email: data.name, password: data.password);
      _nav.navigateToRoute(Routes.manageApp);
    } catch (e) {
      return e.toString(); 
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _auth = Provider.of<AuthenticationProvider>(context);
    _nav = GetIt.I<NavigationService>();

    return CustomNavPage(
      myIndex: PageIndex.loginAdmin,
      size: size,
      child: FlutterLogin(
      title: APP_MANAGER_LOGIN_MESSAFES['title']!,
        // Styles.themeData(isDarkMode: themeProvider.isDarkMode, context: context),
      theme: LoginTheme(
        primaryColor: const Color.fromARGB(255, 231, 190, 166),
        accentColor: const Color.fromARGB(255, 28, 23, 184),
        errorColor: Colors.red,
        titleStyle: const TextStyle(
          color: Color.fromARGB(255, 66, 69, 72),
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
        textFieldStyle: const TextStyle(
          color: Color.fromARGB(255, 49, 98, 141),
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
        buttonStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
        
      ),
      onLogin: (LoginData data)async => await _signIn(data, context),
      onRecoverPassword: (String email) {
        return Future.delayed(const Duration(seconds: 1), () {
          return APP_MANAGER_LOGIN_MESSAFES['recoverPasswordSuccess']!;
        });
      },          
      messages: LoginMessages(
        userHint: APP_MANAGER_LOGIN_MESSAFES['userHint']!,
        passwordHint: APP_MANAGER_LOGIN_MESSAFES['passwordHint']!,
        confirmPasswordHint: APP_MANAGER_LOGIN_MESSAFES['confirmPasswordHint']!,
        loginButton: APP_MANAGER_LOGIN_MESSAFES['loginButton']!,
        forgotPasswordButton: APP_MANAGER_LOGIN_MESSAFES['forgotPasswordButton']!,
        recoverPasswordButton: APP_MANAGER_LOGIN_MESSAFES['recoverPasswordButton']!,
        goBackButton: APP_MANAGER_LOGIN_MESSAFES['goBackButton']!,
        confirmPasswordError: APP_MANAGER_LOGIN_MESSAFES['confirmPasswordError']!,
        recoverPasswordIntro: APP_MANAGER_LOGIN_MESSAFES['recoverPasswordIntro']!,
        recoverPasswordDescription: APP_MANAGER_LOGIN_MESSAFES['recoverPasswordDescription']!,
        recoverPasswordSuccess: APP_MANAGER_LOGIN_MESSAFES['recoverPasswordSuccess']!,
      ),
    ),
    );
  }
}