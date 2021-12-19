import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var money = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBar(
          title: Text("Home"),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(7),
                        ),
                        color: Colors.green[500],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Income",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$" + money.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(7),
                        ),
                        color: Colors.red[500],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Expenses",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "\$2,000",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  Navigator.pushNamed(context, "/add");
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
