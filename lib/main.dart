import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:flutter_m/routes/route_config.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = MyAppRouter().router; //go_route custom routes.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
        routerConfig: _router,
        title: "Flutter Module",
        debugShowCheckedModeBanner: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
