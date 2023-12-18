import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteViewState extends StatefulWidget {
  const FavoriteViewState({super.key});

  @override
  State<FavoriteViewState> createState() => __FavoriteViewStateState();
}

class __FavoriteViewStateState extends State<FavoriteViewState> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        shadowColor: Colors.blue,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blue[100],
                child: ListTile(
                  trailing: Icon(Icons.favorite),
                  title: Text('From:'),
                  leading: Icon(Icons.attach_money),
                ),
              );
            },
            itemCount: number + 1,
          ),
        ],
      ),
    );
  }
}
