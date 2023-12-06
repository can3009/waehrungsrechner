import 'package:flutter/material.dart';

class DrawerFav extends StatefulWidget {
  const DrawerFav({Key? key}) : super(key: key);

  @override
  DrawerFavState createState() => DrawerFavState();
}

class DrawerFavState extends State<DrawerFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.indigo,
      ),
    );
  }
}


//kann ich nutzen um auf die homeview zu führen
// '@override
// Widget build(BuildContext context) => SizedBox(
//       child: TextButton(
//           child: Text(
//             'fav ',
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomeView(),
//                 ));
//           }),
//     );'