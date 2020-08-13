import 'package:app_shoe/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_shoe/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Login()
    );
  }
}