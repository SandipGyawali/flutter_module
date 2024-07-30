import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // User is signed in
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.pushNamed(MyAppRouteConstants.layoutRoute);
              });
              return const Center(child: CircularProgressIndicator());
            } else {
              // User is not signed in
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
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
                            context.goNamed(MyAppRouteConstants.loginRoute);
                          },
                        ),
                        const SizedBox(height: 10),
                        Button(
                          label: "Sign up",
                          buttonBgColor: Colors.yellow,
                          onPressed: () {
                            context.goNamed(MyAppRouteConstants.registerRoute);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          }
          // While the connection state is not active, show a loading indicator
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
