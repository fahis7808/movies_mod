import 'package:flutter/material.dart';
import 'package:movies_mod/view/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Mod',
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginPage',
      routes: {
        'loginPage' :(context) =>const LoginPage()
      },
    );
  }
}
