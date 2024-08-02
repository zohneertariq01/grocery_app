import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/controller/language_change_controller.dart';
import 'package:grocery_app/provider/grocery_provider.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/intro_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroceryProvider()),
        ChangeNotifierProvider(create: (_) => LanguageChangeController()),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: Locale('es'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('es'),
            ],
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.indigo,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
