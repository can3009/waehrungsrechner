// ignore_for_file: prefer_expression_function_bodies

import 'package:flutter/material.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_about_app.dart';

import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_fav.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_graph.dart';
import 'package:waehrungsrechner/gui/ansicht/drawer/drawer_language.dart';

// ignore: public_member_api_docs
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 157, 163, 197),
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
            children: [
              ListTile(
                title: const Text('Language'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DrawerLanguage()),
                  );
                },
              ),
              ListTile(
                title: const Text('About App'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DrawerAboutApp()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
