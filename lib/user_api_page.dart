import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'user_detail_page.dart';

class UserApiPage extends StatefulWidget {
  const UserApiPage({super.key});

  @override
  State<UserApiPage> createState() => _UserApiPageState();
}

class _UserApiPageState extends State<UserApiPage> {
  Future<Map<String, dynamic>> userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: FutureBuilder(
        future: userData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List userList = snapshot.data!["data"];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ...userList.map(
                    (user) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return UserDetailPage(
                                user: user,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user["avatar"].toString()),
                          ),
                          title: Text(
                              user["first_name"] + " " + user["last_name"]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("No Data Available");
          }
        },
      ),
    );
  }
}
