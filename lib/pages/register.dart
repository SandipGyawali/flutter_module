import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _Register();
}

class _Register extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

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
                    "SignUp",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Signup with an account",
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
                  vertical: 60,
                ),
                child: Column(
                  children: <Widget>[
                    InputField(
                      label: "Username",
                      obscure: false,
                      hintText: "Enter Username",
                      controller: _nameController,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      label: "Email",
                      obscure: false,
                      hintText: "Enter Email",
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    InputField(
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
                  label: "Signup",
                  buttonBgColor: const Color(0xff7DCD9A),
                  onPressed: () {
                    authProvider.createUserWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                      _nameController.text,
                      context,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushReplacementNamed(
                        MyAppRouteConstants.loginRoute,
                      );
                    },
                    child: const Text(
                      "Login",
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
