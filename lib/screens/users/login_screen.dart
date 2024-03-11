import 'package:flutter/material.dart';
import '/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import '/widgets/custom_login_screen.dart';
import '/services/navigation_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthenticationProvider _auth;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<AuthenticationProvider>(context);
    return CustomLoginScreen(
      title: 'כניסת עובד',
      sigInFunc: _auth.sigInAsUser,
      nextRoute: Routes.home,
    );
  }
}

