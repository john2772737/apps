import 'package:flutter/material.dart';
import 'repositories/go_router.dart'; // Your GoRouter setup
import 'package:go_router/go_router.dart';
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Your GoRouter setup
      debugShowCheckedModeBanner: false,
    );
  }
}
