import 'package:flutter/material.dart';
import 'package:khata_app/screens/screen_splash.dart';
import 'package:provider/provider.dart';
import 'theme_data/light_theme.dart';
import 'theme_data/dark_theme.dart';
import 'theme_data/change_notifire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeNotifireData>(create: (_) => ChangeNotifireData()),
      ],
      child: Consumer<ChangeNotifireData>(
        builder: (context, obj, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightThemeData().lightTheme,
            darkTheme: DarkThemeData().darkTheme,
            themeMode: obj.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const ScreenSplash(),
          );
        },
      ),
    );
  }
}
