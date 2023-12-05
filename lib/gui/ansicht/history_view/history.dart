// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class HistoryViewState extends StatefulWidget {
  const HistoryViewState({super.key});

  @override
  State<HistoryViewState> createState() => __HistoryViewStateState();
}

class __HistoryViewStateState extends State<HistoryViewState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last used'),
      ),
    );
  }
}
