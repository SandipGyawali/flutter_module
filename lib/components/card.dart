import 'package:flutter/material.dart';

class Card_ extends StatelessWidget {
  @override
  const Card_({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.39,
      height: 130,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shadowColor: Colors.grey.shade300,
        child: Text("This is card"),
      ),
    );
  }
}
