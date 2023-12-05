// ignore_for_file: prefer_expression_function_bodies, public_member_api_docs

import 'package:flutter/material.dart';

class DrawerGraph extends StatefulWidget {
  const DrawerGraph({super.key});

  @override
  State<DrawerGraph> createState() => _DrawerGraphState();
}

class _DrawerGraphState extends State<DrawerGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph'),
      ),
    );
  }
}
