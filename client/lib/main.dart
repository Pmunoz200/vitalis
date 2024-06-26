import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemini_folder/firebase/firebase_options.dart';
import 'package:gemini_folder/onboarding/onboarding.dart';
import 'package:gemini_folder/util/app_theme.dart';
import 'package:gemini_folder/user_authentication/login.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.getThemeData(),
      initialRoute: '/authentication',
      navigatorKey: mainNavigatorKey,
      routes: {
        "/authentication": (context) => LoginScreen(
              navigator: mainNavigatorKey,
            ),
        '/token': (context) => HomePage(),
        '/onboarding': (context) =>
            OnboardingScreen(navigator: mainNavigatorKey),
        '/home': (context) => HomePage(),
      },
    );
  }
}
