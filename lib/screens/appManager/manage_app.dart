import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/providers/authentication_provider.dart';
import 'package:azn_hollyfood_flutter_app/providers/gsheets_provider.dart';
import 'package:provider/provider.dart';
import '/services/database_services.dart';
import '/services/methods.dart';
import '/widgets/subtitle_text.dart';
import '/widgets/title_text.dart';
import 'package:logger/logger.dart';
import '/services/navigation_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import '../../models/user/user_entity.dart';
import '/utils/constants.dart';

class ManageApp extends StatefulWidget {
  const ManageApp({super.key});

  @override
  State<ManageApp> createState() => _ManageAppState();
}

class _ManageAppState extends State<ManageApp> {
  late DataBaseService _db;
  late NavigationService _nav;
  late AuthenticationProvider _auth;
  late GSheetsProvider _gsheets;
  List<UserEntity?> users = [];

  void refreshUser() async {
    Logger().log(Level.info, 'Refreshing users');
    try {
      List<UserEntity?> users = await _gsheets.getUsers(USERS_SPREADSHEET_NAME);
      Log.debug('Users: $users');
      // for (UserEntity? user in users) {
      //   await _db.createOrUpdateUser(user!);
      // }
      Log.info('Users updated');
      setState(() { 
      AppMethods.showSuccessDialog( 
        context: context,
        func: () {},
        subtitle: 'משתמשים עודכנו בהצלחה',
      );
      });
    } catch (e) {
      setState(() {
        AppMethods.showErrorOrWarningDialog(
          context: context,
          func: () {},
          isError: true,
          subtitle: e.toString(),
        );
      });
    }
  }
  void refreshProducts() async {
    Logger().log(Level.info, 'Refreshing products');
    try {
      List<Product?> products = await _gsheets.getProductss();
      Log.debug('Products: $products');
      for (Product? product in products) {
        await _db.createOrFoundProduct(product!);
      }
      Log.info('Product updated');
      setState(() { 
      AppMethods.showSuccessDialog( 
        context: context,
        func: () {},
        subtitle: 'מוצרים עודכנו בהצלחה',
      );
      });
    } catch (e) {
      setState(() {
        AppMethods.showErrorOrWarningDialog(
          context: context,
          func: () {},
          isError: true,
          subtitle: e.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _db = GetIt.I<DataBaseService>();
    _auth = Provider.of<AuthenticationProvider>(context);
    _gsheets = GetIt.I<GSheetsProvider>();
    _nav = GetIt.I<NavigationService>();

    //button refresh for users
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(217, 174, 242, 247),
        appBar: AppBar(
          title: const TitleText(label: 'ניהול אפליקציה'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await _auth
                    .signOut()
                    .then((_) => _nav.navigateToRoute(Routes.initialRoute));
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.sheetPlastic, size: 35),
              title:
                  const SubtitleTextWidget(label: 'עדכון משתמשים מגוגל שיטס'),
              onTap: refreshUser,
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.table, size: 35),
              title: const SubtitleTextWidget(label: 'טבלת משתמשים'),
              onTap: () {
                _nav.navigateToRoute(Routes.usersTable);
              },
            ),
            const SizedBox(height: 10),
            const TitleText(label: 'מוצרים'),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.sheetPlastic, size: 35),
              title:
                  const SubtitleTextWidget(label: 'עדכון מוצרים מגוגל שיטס'),
              onTap: refreshProducts,
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.table, size: 35),
              title: const SubtitleTextWidget(label: 'טבלת מוצרים'),
              onTap: () {
                _nav.navigateToRoute(Routes.productsTable);
              },
            ),
          ],
        ),
      ),
    );
  }
}
