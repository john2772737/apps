
import 'package:app/pages/profilePage.dart';
import 'package:app/pages/registerPage.dart';
import 'package:go_router/go_router.dart';

import '../pages/loginPage.dart';
import '../pages/editPage.dart';
import '../pages/loadingScreen.dart';
import '../pages/baseScreen.dart';
import '../pages/uploadimage.dart';


final GoRouter router = GoRouter(
  initialLocation: "/loginPage",
  routes: <RouteBase>[
   GoRoute(
  name: "loading",
  path: "/loading",
  builder: (context, state) {
    
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
  builder: (context, state) {
    // Retrieve the userId from the extra parameter
    final userId = state.extra as int?;

    return BaseScreen(
      child: ProfilePage(userId: userId), // Pass the userId to ProfilePage
    );
  },
),

    GoRoute(
      name: "uploadimage",
      path: "/uploadimage",
      builder: (context, state) => Uploadimage(),
    ),
  ],
);
