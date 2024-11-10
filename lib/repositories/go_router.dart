import 'package:app/blocs/bloc/wifi_state.dart';
import 'package:app/pages/profilePage.dart';
import 'package:app/pages/registerPage.dart';
import 'package:go_router/go_router.dart';
import 'package:open_settings/open_settings.dart';
import '../pages/loginPage.dart';
import '../pages/editPage.dart';
import '../pages/loadingScreen.dart';
import '../pages/baseScreen.dart';
import '../blocs/bloc/wifi_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  initialLocation: "/profilePage",
  routes: <RouteBase>[
    GoRoute(
  name: "loading",
  path: "/loading",
  builder: (context, state) {
    return BlocListener<WifiBloc, WifiState>(
      listener: (context, wifiState) {
        if (wifiState is Connected) {
          // Navigate to login page when connected
          context.go('/loginPage');
        } else if (wifiState is notConnected) {
          // Handle when not connected (maybe show a dialog or open settings)
          OpenSettings.openWIFISetting();
        } else if (wifiState is Error) {
          // Show error dialog
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(wifiState.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          });
        }
      },
      child: BlocBuilder<WifiBloc, WifiState>(
        builder: (context, wifiState) {
          // Show loading screen until we know the connection state
          return LoadingScreen();
        },
      ),
    );
  },
),

    GoRoute(
      name: "loginPage",
      path: "/loginPage",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: "editPage",
      path: "/editPage/:id",
      builder: (context, state) => Editpage(),
    ),
    GoRoute(
      name: "registerPage",
      path: "/registerPage",
      builder: (context, state) => Registerpage(),
    ),
    GoRoute(
      name: "profilePage",
      path: "/profilePage",
      builder: (context, state) => BaseScreen(child: Profilepage()),
    ),
  ],
);
