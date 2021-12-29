import 'package:finances/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _darkTheme = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<SettingsProvider>(context);
    themeData.isDarkMode.then((value) => setState(() => _darkTheme = value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: _darkTheme,
                onChanged: (bool value) {
                  setState(() => _darkTheme = value);
                  themeData.setDarkMode(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
