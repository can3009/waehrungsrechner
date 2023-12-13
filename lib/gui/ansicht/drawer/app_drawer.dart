// ignore_for_file: prefer_expression_function_bodies

import 'package:flutter/material.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_about_app.dart';

import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_fav.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_graph.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_language.dart';

// ignore: public_member_api_docs
class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

bool isDarkMode = false;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 116, 204),
            ),
            child: Text(
              'Währungs-Rechner',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          ListTile(
            title: const Text('Favorite'),
            leading: Icon(Icons.favorite),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DrawerFav()),
                // Aktion für Item 1
              );
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Graph '),
            leading: Icon(Icons.show_chart_outlined),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DrawerGraph()),
                // Aktion für Item 2
              );
            },
          ),
          // ExpansionTile für Settings
          ExpansionTile(
            title: const Text('Settings'),
            leading: Icon(Icons.settings),
            children: [
              ListTile(
                title: const Text('Language'),
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DrawerLanguage()),
                  );
                },
              ),
              ListTile(
                title: const Text('About App'),
                leading: Icon(Icons.local_offer_rounded),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DrawerAboutApp()),
                  );
                },
              ),
              ListTile(
                title: Text('Dark mode'),
                leading:
                    isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
                onTap: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
