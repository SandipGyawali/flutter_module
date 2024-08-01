import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1.0;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.all(_margin),
          width: _width,
          color: _color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                  });
                },
                child: const Text("Animate Margin"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.red;
                  });
                },
                child: const Text("Animate Color"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _width = 300;
                  });
                },
                child: const Text("Animate Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: const Text("Animate Opacity"),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: const Text(
                  "Hide Me",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
