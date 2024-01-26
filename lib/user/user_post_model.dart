// ignore_for_file: public_member_api_docs, sort_constructors_first
//Request
// {
//     "name": "morpheus",
//     "job": "leader"
// }

class UserRequestModel {
  final String name;
  final String job;
  UserRequestModel({
    required this.name,
    required this.job,
  });

  Map<String, String> toJson() {
    return {"name": name, "job": job};
  }
}

//Response
//   {
//     "name": "morpheus",
//     "job": "leader",
//     "id": "46",
//     "createdAt": "2024-01-26T03:10:13.982Z"
// }

// {
//     "name": "morpheus",
//     "job": "leader",
//     "id": "46",
//     "createdAt": "2024-01-26T03:10:13.982Z"
// }

class UserResponseModel {
  final String name;
  final String job;
  final String id;
  final String createdAt;
  UserResponseModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory UserResponseModel.fromJson(var json) {
    return UserResponseModel(
      name: json["name"] ?? "",
      job: json["job"] ?? "",
      id: json["id"] ?? "0",
      createdAt: json["createdAt"] ?? "",
    );
  }

  @override
  String toString() {
    return 'UserResponseModel(name: $name, job: $job, id: $id, createdAt: $createdAt)';
  }
}
