import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_mod/util/theme.dart';
import 'package:movies_mod/view/screen/home_page.dart';
import 'package:movies_mod/view/screen/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          title: 'Movies Mod',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeData(ThemeMode.light),
          darkTheme: AppTheme.getThemeData(ThemeMode.dark),
          themeMode: theme,
          initialRoute: 'loginPage',
          routes: {
            'loginPage' :(context) =>const LoginPage(),
            'homePage' :(context) =>const HomePage()
          },
        );
      }
    );
  }
}
