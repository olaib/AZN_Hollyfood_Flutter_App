import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/authentication_provider.dart';
import '/widgets/custom_login_screen.dart';
import '/services/navigation_service.dart';


class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

//using the custom login screen widget
class _AdminLoginScreenState extends State<AdminLoginScreen> {
  late final AuthenticationProvider _auth;
  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<AuthenticationProvider>(context);
    return CustomLoginScreen(
      title: 'כניסת מנהל',
      sigInFunc: _auth.sigInAsAdmin,
      nextRoute: Routes.adminPanel,
    );
  }
}