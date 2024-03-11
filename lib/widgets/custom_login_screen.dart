import 'package:azn_hollyfood_flutter_app/services/methods.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:azn_hollyfood_flutter_app/widgets/custom_text_form_field.dart';
import 'package:azn_hollyfood_flutter_app/widgets/subtitle_text.dart';
import '/widgets/title_text.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import '/services/navigation_service.dart';

class CustomLoginScreen extends StatefulWidget {
  const CustomLoginScreen(
      {super.key,
      required this.title,
      String? usernameHintText,
      String? usernameReg,
      String? usernameFormate,
      String? passwordHintText,
      String? passwordReg,
      String? passwordFormate,
      required this.sigInFunc,
      required this.nextRoute})
      : usernameHintText = usernameHintText ?? USER_HINT_TEXT,
        usernameReg = usernameReg ?? USERNAME_REG_EXP,
        usernameFormate = usernameFormate ?? USERNAME_FORMATE,
        passwordHintText = passwordHintText ?? PASSWORD_HINT_TEXT,
        passwordReg = passwordReg ?? PASSWORD_REG_EXP,
        passwordFormate = passwordFormate ?? PASSWORD_FORMATE;

  final String usernameHintText;
  final String title;
  //username reg
  final String usernameReg;
  //password reg
  final String passwordReg;
  //username formate
  final String usernameFormate;
  //password formate
  final String passwordFormate;
  //password hint text
  final String passwordHintText;
  //sign in function
  final Function({required String username, required String password})
      sigInFunc;
  //next route
  final Routes nextRoute;

  @override
  State<CustomLoginScreen> createState() => _CustomLoginScreenState();
}

class _CustomLoginScreenState extends State<CustomLoginScreen> {
  static late NavigationService _nav;
  static late Size _deviceSize;

  final _loginFormKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;
    _nav = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceSize.width * 0.03,
            vertical: _deviceSize.height * 0.02,
          ),
          height: _deviceSize.height * 0.98,
          width: _deviceSize.width * 0.97,
          // Add this
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TitleText(
                  label: widget.title,
                  fontSize: 40,
                  color: const Color.fromARGB(255, 49, 98, 141)),
              SizedBox(height: _deviceSize.height * 0.04),
              const SubtitleTextWidget(label: WELCOME_BACK, fontSize: 30),
              const SubtitleTextWidget(
                  label: SIGN_IN_TO_CONTINUE, fontSize: 20),
              const SizedBox(height: 20),
              _loginForm(),
              SizedBox(height: _deviceSize.height * 0.2),
              _loginButton(),
              SizedBox(height: _deviceSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceSize.height * 0.18,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomTextFormField(
                regExp: widget.usernameReg,
                hintText: widget.usernameHintText,
                obscureText: false,
                formate: widget.usernameFormate,
                onSaved: (val) => {
                      setState(() {
                        _username = val;
                      })
                    }),
            SizedBox(height: _deviceSize.height * 0.02),
            Expanded(
              child: CustomTextFormField(
                  regExp: widget.passwordReg,
                  hintText: widget.passwordHintText,
                  obscureText: true,
                  formate: widget.passwordFormate,
                  onSaved: (val) => {
                        setState(() {
                          _password = val;
                        })
                      }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    try {
      if (_loginFormKey.currentState!.validate()) {
        _loginFormKey.currentState!.save();
        await widget.sigInFunc(username: _username!, password: _password!);
        _nav.navigateToRoute(widget.nextRoute);
      }
    } catch (e) {
      Log.error('login error: $e');
      setState(() {
        AppMethods.showErrorOrWarningDialog(
          context: context,
          subtitle: e.toString(),
          func: () => {},
          isError: true,
        );
      });
    }
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(
          horizontal: _deviceSize.width * 0.2,
          vertical: _deviceSize.height * 0.02,
        ),
      ),
      onPressed: () async => await _signIn(context),
      child: const Text('כניסה'),
    );
  }
}
