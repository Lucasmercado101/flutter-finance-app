import 'package:finances/pages/home/home.dart';
import 'package:finances/providers/settings_provider.dart';
import 'package:finances/router.dart';
import 'package:finances/transactionsStorage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/transactions_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TransactionsProvider()),
    ChangeNotifierProvider(create: (_) => SettingsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<SettingsProvider>(context);

    themeData.isDarkMode.then((value) => setState(() => _darkMode = value));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: _darkMode ? Brightness.dark : Brightness.light,
      ),
      home: const HomePage(),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
