import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Währungsumrechner')),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
