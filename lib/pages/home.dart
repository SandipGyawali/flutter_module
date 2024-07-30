import 'package:flutter/material.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Find you",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context)
                .pushReplacementNamed(MyAppRouteConstants.sliverRoute);
          },
          child: const Text("Sliver demo"),
        ),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context)
                .pushReplacementNamed(MyAppRouteConstants.sandbox);
          },
          child: const Text("Animations"),
        ),
      ],
    );
  }
}
