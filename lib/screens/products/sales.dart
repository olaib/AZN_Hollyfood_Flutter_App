import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  late NavigationService _nav;

  @override
  Widget build(BuildContext context) {
    _nav = GetIt.I.get<NavigationService>();
    return Material(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('ביצוע מכירות'),
            onTap: () => _nav.navigateToRoute(Routes.sales),
          ),
          ListTile(
            title: const Text('ניתוח מכירות'),
            onTap: () => _nav.navigateToRoute(Routes.salesAnalysis),
          ),
        ],
      ),
    );
  }
}
