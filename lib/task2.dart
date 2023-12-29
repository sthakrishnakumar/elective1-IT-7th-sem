import 'package:flutter/material.dart';

class Task2Page extends StatelessWidget {
  Task2Page({super.key});

  var gap = const SizedBox(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.hF8_3tDhRrZvxm-j1kZwgwHaE9?w=265&h=180&c=7&r=0&o=5&pid=1.7",
                  ),
                ),
              ),
              height: 100,
              width: 100,
            ),
            gap,
            const Text(
              "Flutter Dash",
              style: TextStyle(color: Colors.white),
            ),
            gap,
            Text(
              "Flutter Developer".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
            gap,
            Container(
              height: 3,
              width: 200,
              color: Colors.grey,
            ),
            gap,
            Container(
              color: Colors.white,
              height: 50,
              width: 300,
              // padding: const EdgeInsets.only(left: 10),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text("+977 9876543210"),
                ],
              ),
            ),
            gap,
            Container(
              color: Colors.white,
              height: 50,
              width: 300,
              // padding: const EdgeInsets.only(left: 10),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.mail,
                      color: Colors.teal,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text("example@gmail.com"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
