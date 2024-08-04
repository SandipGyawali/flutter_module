import 'package:flutter/material.dart';
import 'package:flutter_m/components/employee_form.dart';
import 'package:flutter_m/model/book_model.dart';
import 'package:flutter_m/pages/home.dart';
import 'package:flutter_m/pages/individual_book_page.dart';
import 'package:flutter_m/pages/layout.dart';
import 'package:flutter_m/pages/login.dart';
import 'package:flutter_m/pages/register.dart';
import 'package:flutter_m/pages/base.dart';
import 'package:flutter_m/pages/sandbox.dart';
import 'package:flutter_m/pages/selected_news.dart';
import 'package:flutter_m/pages/sliver.dart';
import 'package:flutter_m/pages/sqflite/lite_home.dart';
import 'package:flutter_m/pages/test_page.dart';
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
      ),
      GoRoute(
        name: MyAppRouteConstants.testRoute,
        path: "/testRoute",
        pageBuilder: (context, state) {
          return const MaterialPage(child: TestPage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.employeeForm,
        path: "/employeeForm",
        pageBuilder: (context, state) {
          return const MaterialPage(child: EmployeeForm());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.bookRoute,
        path: "/bookRoute",
        pageBuilder: (context, state) {
          var extra = state.extra as BookModel;
          return MaterialPage(child: IndividualBookPage(bookDetail: extra));
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.sqfliteRoute,
        path: "/sqfliteRoute",
        pageBuilder: (context, state) {
          return const MaterialPage(child: LiteHome());
        },
      )
    ],
  );
}
