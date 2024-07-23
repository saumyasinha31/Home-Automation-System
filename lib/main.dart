import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/dashboard_screen.dart';
import 'screens/settings_screen.dart';
import 'theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeNotifier(isDarkTheme),
    child: HomeAutomationApp(),
  ));
}

class HomeAutomationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Home Automation App',
      theme: themeNotifier.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: DashboardScreen(),
      routes: {
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
