import 'package:finances/pages/add_amount_page.dart';
import 'package:finances/pages/home/home.dart';
import "dart:core";
import "package:flutter/material.dart";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "/");

    switch (uri.path) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
      case "/add":
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
