import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // themeMode: ThemeMode.dark,
      title: 'Chatter',
      home: const HomeScreen(),
    );
  }
}
