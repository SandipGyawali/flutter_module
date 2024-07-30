import 'package:flutter/material.dart';
import 'package:flutter_m/model/news_list_model.dart';

class SelectedNewsScreen extends StatelessWidget {
  const SelectedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Text("Selected News"),
        ),
      ),
    );
  }
}
