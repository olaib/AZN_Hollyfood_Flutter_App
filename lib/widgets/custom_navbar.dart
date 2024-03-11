import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:azn_hollyfood_flutter_app/services/assets_manager.dart';

enum PageIndex {
  home,
  loginUser,
  loginAdmin,
  manageApp,
}

class NavButton {
  final IconData myIcon;
  final PageIndex myIndex;
  final Routes myRoute;

  get icon => myIcon;
  get index => myIndex;
  get route => myRoute;

  NavButton({
    required this.myIcon,
    required this.myIndex,
    required this.myRoute,
  });
}

List<NavButton> navButtonsData = [
  NavButton(
    myIcon: FontAwesomeIcons.house,
    myIndex: PageIndex.home,
    myRoute: Routes.initialRoute,
  ),
  NavButton(
    myIcon: FontAwesomeIcons.user,
    myIndex: PageIndex.loginUser,
    myRoute: Routes.login,
    // myRoute: Routes.home,
  ),
  NavButton(
    myIcon: FontAwesomeIcons.userTie,
    myIndex: PageIndex.loginAdmin,
    // myRoute: Routes.adminLogin,
    myRoute: Routes.adminPanel,
  ),
  NavButton(
    myIcon: FontAwesomeIcons.userShield,
    myIndex: PageIndex.manageApp,
    // myRoute: Routes.manageAppLogin,
    myRoute: Routes.manageApp,
  ),
];

// custom unauth navigation bar class
class CustomNavPage extends StatefulWidget {
  const CustomNavPage(
      {super.key,
      required this.child,
      required this.myIndex,
      required this.size});

  final Widget child;
  final PageIndex myIndex;
  final Size size;

  @override
  State<CustomNavPage> createState() => _CustomNavPageState();
}

class _CustomNavPageState extends State<CustomNavPage> {
  late PageIndex currentIndex;

  void setBottomBarIndex(PageIndex index, Routes route) {
    if (currentIndex == index) return;
    setState(() {
      currentIndex = index;
    });
    Navigator.pushNamed(context, route.url);
  }

  @override
  Widget build(BuildContext context) {
    currentIndex = widget.myIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HollyFood'),
      ),
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: widget.size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(widget.size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      elevation: 0.1,
                      onPressed: () {},
                      child: Image(
                        image: AssetImage(AssetsManager.logoImage),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Container(
                    width: widget.size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...navButtonsData
                            .sublist(0, 2)
                            .map((button) => customIconButton(
                                  context: context,
                                  currentIndex: currentIndex,
                                  index: button.index,
                                  icon: button.icon,
                                  route: button.route,
                                )),
                        Container(
                          width: widget.size.width * 0.20,
                        ),
                        ...navButtonsData
                            .sublist(2)
                            .map((button) => customIconButton(
                                  context: context,
                                  currentIndex: currentIndex,
                                  index: button.index,
                                  icon: button.icon,
                                  route: button.route,
                                )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customIconButton(
      {required BuildContext context,
      required PageIndex currentIndex,
      required PageIndex index,
      required IconData icon,
      required Routes route}) {
    return IconButton(
        icon: FaIcon(
          icon,
          color: currentIndex == index
              ? const Color.fromARGB(255, 255, 255, 255)
              : Colors.black,
        ),
        onPressed: () => setBottomBarIndex(index, route));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 136, 253, 112)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
