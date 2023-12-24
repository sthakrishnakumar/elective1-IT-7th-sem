import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

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
            Text("Count is $count"),
            InkWell(
              onTap: () {
                print("Button Clicked");
                setState(() {});
                count = count + 1;

                print(count);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 100),
                color: const Color.fromARGB(255, 103, 202, 192),
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
