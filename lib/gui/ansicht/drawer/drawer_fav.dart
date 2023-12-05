import 'package:flutter/material.dart';

class DrawerFav extends StatefulWidget {
  const DrawerFav({Key? key}) : super(key: key);

  @override
  _DrawerFavState createState() => _DrawerFavState();
}

class _DrawerFavState extends State<DrawerFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
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