import 'package:waehrungsrechner/data/models/models.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
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
              // Aktion für Item 1
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Graph '),
            onTap: () {
              // Aktion für Item 2
              //  icon: Icon(Icons.history);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              // Aktion für Item 3
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About App'),
            onTap: () {
              // Aktion für Item 4
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
