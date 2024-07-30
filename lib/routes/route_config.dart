import 'package:flutter/material.dart';
import 'package:flutter_m/pages/home.dart';
import 'package:flutter_m/pages/layout.dart';
import 'package:flutter_m/pages/login.dart';
import 'package:flutter_m/pages/register.dart';
import 'package:flutter_m/pages/base.dart';
import 'package:flutter_m/pages/sandbox.dart';
import 'package:flutter_m/pages/selected_news.dart';
import 'package:flutter_m/pages/sliver.dart';
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
          return const MaterialPage(child: BaseScreen());
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
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.layoutRoute,
        path: "/layout",
        pageBuilder: (context, state) {
          return MaterialPage(child: LayoutPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.sliverRoute,
        path: "/sliver",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SliverPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.sandbox,
        path: "/sandbox",
        pageBuilder: (context, state) {
          return const MaterialPage(child: Sandbox());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.photos,
        path: "/photos",
        pageBuilder: (context, state) {
          return const MaterialPage(child: Sandbox());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.selectedNews,
        path: "/selectedNews",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SelectedNewsScreen());
        },
      )
    ],
  );
}
