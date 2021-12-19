import 'package:finances/pages/addAmountPage.dart';
import 'package:finances/pages/home.dart';
import "package:flutter/material.dart";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
      case "/add/":
        return MaterialPageRoute(builder: (_) => AddAmountPage());
      default:
        // TODO
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
