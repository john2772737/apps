import 'package:flutter/material.dart';
import '../components/customAppBar.dart';
import '../components/customEndDrawer.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;

    List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.settings,
        'title': 'Settings',
      },
    ];
    
    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: CustomEndDrawer(
          isLoggedIn: isLoggedIn,
          menuItems: menuItems,
        ),
      body: child,
    );
  }
}
