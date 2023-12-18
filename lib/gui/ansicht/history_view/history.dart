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
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Last used'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[100],
            child: ListTile(
              trailing: Icon(Icons.history),
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
