import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc/wifi_bloc.dart'; // Import your WifiBloc
import 'repositories/go_router.dart'; // Assuming your GoRouter is set up here
import 'blocs/bloc/wifi_event.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WifiBloc()..add(WifiEvent.status()), // Trigger event on app start
      child: MyApp(),
    ),
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
