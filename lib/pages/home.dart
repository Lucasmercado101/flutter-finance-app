import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: Row(
            children: [
              Container(
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: Text(
                  "Setting",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Text("Home Page"),
      ]),
    );
  }
}
