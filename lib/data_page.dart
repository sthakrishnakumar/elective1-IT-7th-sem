import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<String> nameList = ["Ram", "Hari", "Shyam", "Gita", "Hello", "World"];
  var data = [
    {"name": "Ram", "address": "Sanepa"},
    {"name": "HAri", "address": "Sanepa1"},
    {"name": "Shyam", "address": "Sanepa2"},
    {"name": "Gita", "address": "Sanepa3"},
    {"name": "Hello", "address": "Sanepa4"},
    {"name": "World", "address": 5},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data Page"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Text(
                "  I am ${data[index]["name"]}. I am from ${data[index]["address"]}.");
          },
        )

        // ListView(
        //   children: [
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //     ...nameList.map((e) => Text(e)),
        //   ],
        // ),
        );
  }
}
