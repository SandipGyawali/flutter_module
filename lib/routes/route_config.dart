import 'package:flutter/material.dart';
import 'package:flutter_m/pages/home.dart';
import 'package:flutter_m/pages/login.dart';
import 'package:flutter_m/pages/register.dart';
import 'package:flutter_m/pages/splash.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: MyAppRouteConstants.baseRoute,
        path: "/",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginRoute,
        path: "/login",
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.registerRoute,
        path: "/register",
        pageBuilder: (context, state) {
          return const MaterialPage(child: RegisterPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.homeRoute,
        path: "/home",
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      )
    ],
  );
}
