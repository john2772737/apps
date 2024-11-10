
import 'package:app/pages/profilePage.dart';
import 'package:app/pages/registerPage.dart';
import 'package:go_router/go_router.dart';

import '../pages/loginPage.dart';
import '../pages/editPage.dart';
import '../pages/loadingScreen.dart';
import '../pages/baseScreen.dart';


final GoRouter router = GoRouter(
  initialLocation: "/profilePage",
  routes: <RouteBase>[
   GoRoute(
  name: "loading",
  path: "/loading",
  builder: (context, state) {
    // Simulate a delay for the loading screen
    Future.delayed(Duration(seconds: 3), () {
      // You can navigate to another route after the delay
      context.go("/loginPage");
    });
    return LoadingScreen();
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
