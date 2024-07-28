import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Flutter module which helps you to learn flutter better and industry ready",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/auth_sample.jpg"),
                  ),
                ),
              ),
              Column(
                children: [
                  Button(
                    label: "Login",
                    buttonBgColor: Colors.white,
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.loginRoute);
                    },
                  ), //custom component
                  const SizedBox(height: 10),
                  Button(
                    label: "Sign up",
                    buttonBgColor: Colors.yellow,
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.registerRoute);
                    },
                  ), //custom component
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
