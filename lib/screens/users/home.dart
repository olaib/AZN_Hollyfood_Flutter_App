import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NavigationService _nav;
  static final listTilesData = List<Map<String, dynamic>>.from([
    {'title': 'מכירות', 'route': Routes.sales},
    {'title': 'רכש', 'route': Routes.purchase},
    {'title': 'ייצור', 'route': Routes.production},
    {'title': 'מלאי', 'route': Routes.inventory},
    {'title': 'עובדים', 'route': Routes.employees},
  ]);
  
  void goTo(Routes route) {
    _nav.navigateToRoute(route);
  }
  @override
  Widget build(BuildContext context) {
    _nav = GetIt.I.get<NavigationService>();
    return Material(
      child: ListView.builder(
        itemCount: listTilesData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listTilesData[index]['title']!),
            onTap: () => goTo(listTilesData[index]['route'] as Routes),
          );
        },
      ),
    );
  }
}
