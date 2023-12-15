import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text("Hello"),
            ),
            const Text("World"),
            InkWell(
              onTap: () {
                print("Button Clicked");
              },
              child: Container(
                margin: const EdgeInsets.only(left: 100),
                color: Colors.green,
                height: 50,
                width: 200,
                child: const Center(
                  child: Text(
                    "Click Me",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
