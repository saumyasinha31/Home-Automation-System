import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme_notifier.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationEnabled = prefs.getBool('isNotificationEnabled') ?? true;
    });
  }

  Future<void> _toggleNotification() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationEnabled = !_isNotificationEnabled;
      prefs.setBool('isNotificationEnabled', _isNotificationEnabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          ListTile(
            title: Text('Dark Theme'),
            trailing: Switch(
              value: themeNotifier.isDarkTheme,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
            ),
          ),
          ListTile(
            title: Text('Enable Notifications'),
            trailing: Switch(
              value: _isNotificationEnabled,
              onChanged: (value) {
                _toggleNotification();
              },
            ),
          ),
        ],
      ),
    );
  }
}
