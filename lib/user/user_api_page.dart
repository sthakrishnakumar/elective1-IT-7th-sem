import 'dart:convert';
import 'package:elective/home_page.dart';
import 'package:elective/user/user_repository.dart';
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

  String responseData = "Data Not Posted";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: FutureBuilder(
        future: UserRepository().userData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data!.data;
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
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text("${user.firstName} ${user.lastName}"),
                        ),
                      ),
                    ),
                  ),
                  //POST
                  Text(responseData),
                  ElevatedButton(
                    onPressed: () async {
                      final response = await UserRepository()
                          .postJob(name: "Elective", job: "Flutter");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "${response["id"]} " + response["createdAt"])));

                      if (response["job"] == "Flutter") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const HomePage();
                            },
                          ),
                        );
                      }
                      var createdAt = response;
                      setState(() {
                        responseData = createdAt.toString();
                      });
                    },
                    child: const Text("Post Job"),
                  )
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
