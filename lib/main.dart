import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controllers/auth_controller.dart';
import 'Controllers/functionality_controller.dart';
import 'Controllers/setup_controller.dart';
import 'constants/constants.dart';
import 'views/splash.dart';

// anuj
// anuj@123
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SetupController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => FunctionalityController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, authController, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Alneem',
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: ThemeMode.light,
          home: Splash(),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      primaryColor: Constants.secondaryColor,
      textTheme: GoogleFonts.outfitTextTheme(base.textTheme),
    );
  }

  ThemeData _buildDarkTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF121213),
      primaryColor: Constants.secondaryColor,
      textTheme: GoogleFonts.outfitTextTheme(
        base.textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    );
  }
}

// manager
// nazeer
// tayyab
