import 'package:flutter/material.dart';
import '/services/assets_manager.dart';
import '/widgets/custom_navbar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title, required this.welcomeMessage});
  final String title;
  final String welcomeMessage;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CustomNavPage(
      myIndex: PageIndex.home,
      size: size,
      child: _panel(size),
    );
  }

  Widget _panel(Size deviceSize) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage(
                  AssetsManager.getImagePath(ImagePath.backgroundImage)),
              width: deviceSize.width,
              height: deviceSize.height * 0.6,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.welcomeMessage,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
