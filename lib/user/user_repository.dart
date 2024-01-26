import 'dart:convert';
import 'package:elective/user/user_post_model.dart';
import 'package:elective/user/users_model.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<UsersModel> userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    Map<String, dynamic> data = jsonDecode(response.body);
    return UsersModel.fromJson(data);
  }

  Future<UserResponseModel> postJob(UserRequestModel userRequestModel) async {
    Response response = await post(
      Uri.parse("https://reqres.in/api/users"),
      body: userRequestModel.toJson(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return UserResponseModel.fromJson(data);
  }
}
