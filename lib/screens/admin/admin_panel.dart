import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:azn_hollyfood_flutter_app/providers/authentication_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  late final NavigationService _nav;
  late final AuthenticationProvider _auth;

  Future<void> _signOut(context) async {
    Log.debug('Signing out');
    await _auth.signOut()
    .then((_) => _nav.navigateToRoute(Routes.initialRoute))
    .catchError((error) => Log.error('Error signing out: $error'));
  }

  @override
  Widget build(BuildContext context) {
    _nav = GetIt.I<NavigationService>();
    _auth = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: ()async => await _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Admin Panel',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/admin/add-product');
              },
              child: const Text('Add Product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.manageProducts.url);
              },
              child: const Text('Manage Products'),
            ),
          ],
        ),
      ),
    );
  }
}
