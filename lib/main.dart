import 'package:dehypnotized/presentation/landing_screen/landing_screen.dart';
import 'package:dehypnotized/resources/app_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.defaultTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          // case '/home':
          //   return MaterialPageRoute(builder: (_) => const HomePage());
          // case '/settings':
          //   return MaterialPageRoute(builder: (_) => const SettingsPage());
          // case '/about':
          //   return MaterialPageRoute(builder: (_) => const AboutPage());
          default:
            return MaterialPageRoute(builder: (_) =>const LandingPage());
        }
      }
    );
  }
}
