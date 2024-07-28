import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // auth provider instance.
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 70,
                ),
                child: Column(
                  children: <Widget>[
                    InputField(
                      placeholder: "Enter Email",
                      label: "Email",
                      obscure: false,
                      hintText: "Enter Email",
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      placeholder: "Enter Password",
                      label: "Password",
                      obscure: true,
                      hintText: "Enter Password",
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Button(
                  label: "Login",
                  buttonBgColor: Colors.yellow,
                  onPressed: () {
                    authProvider.signInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                      context,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacementNamed(
                        MyAppRouteConstants.registerRoute,
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
