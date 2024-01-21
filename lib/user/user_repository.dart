import 'dart:convert';
import 'package:elective/user/users_model.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<UsersModel> userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    Map<String, dynamic> data = jsonDecode(response.body);
    return UsersModel.fromJson(data);
  }

  Future<Map<String, dynamic>> postJob(
      {required String name, required String job}) async {
    Response response = await post(
      Uri.parse("https://reqres.in/api/users"),
      body: {"name": name, "job": job},
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}
