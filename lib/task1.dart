import 'package:flutter/material.dart';

class Task1Page extends StatelessWidget {
  const Task1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 50),
              color: Colors.red,
              // height: 100,
              width: 100,
            ),
            // const SizedBox(
            //   width: 100,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  color: Colors.yellow,
                  width: 100,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                  width: 100,
                ),
              ],
            ),
            // const SizedBox(
            //   width: 100,
            // ),
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 50),
              color: Colors.blue,
              // height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
