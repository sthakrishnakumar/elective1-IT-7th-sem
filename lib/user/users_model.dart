// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "page": 2,
//     "per_page": 6,
//     "total": 12,
//     "total_pages": 2,
//     "data": [
//         {
//             "id": 7,
//             "email": "michael.lawson@reqres.in",
//             "first_name": "Michael",
//             "last_name": "Lawson",
//             "avatar": "https://reqres.in/img/faces/7-image.jpg"
//         },
//         {
//             "id": 8,
//             "email": "lindsay.ferguson@reqres.in",
//             "first_name": "Lindsay",
//             "last_name": "Ferguson",
//             "avatar": "https://reqres.in/img/faces/8-image.jpg"
//         },
//         {
//             "id": 9,
//             "email": "tobias.funke@reqres.in",
//             "first_name": "Tobias",
//             "last_name": "Funke",
//             "avatar": "https://reqres.in/img/faces/9-image.jpg"
//         },
//         {
//             "id": 10,
//             "email": "byron.fields@reqres.in",
//             "first_name": "Byron",
//             "last_name": "Fields",
//             "avatar": "https://reqres.in/img/faces/10-image.jpg"
//         },
//         {
//             "id": 11,
//             "email": "george.edwards@reqres.in",
//             "first_name": "George",
//             "last_name": "Edwards",
//             "avatar": "https://reqres.in/img/faces/11-image.jpg"
//         },
//         {
//             "id": 12,
//             "email": "rachel.howell@reqres.in",
//             "first_name": "Rachel",
//             "last_name": "Howell",
//             "avatar": "https://reqres.in/img/faces/12-image.jpg"
//         }
//     ],
//     "support": {
//         "url": "https://reqres.in/#support-heading",
//         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
//     }
// }

class UsersModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserData> data;
  final SupportData supportData;
  UsersModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.supportData,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      page: json["page"] ?? 0,
      perPage: json["per_page"] ?? 0,
      total: json["total"] ?? 0,
      totalPages: json["total_pages"] ?? 0,
      data: List.from(json["data"] ?? [])
          .map((e) => UserData.fromJson(e ?? {}))
          .toList(),
      supportData: SupportData.fromJson(json["support"] ?? {}),
    );
  }
}

// {
//             "id": 7,
//             "email": "michael.lawson@reqres.in",
//             "first_name": "Michael",
//             "last_name": "Lawson",
//             "avatar": "https://reqres.in/img/faces/7-image.jpg"
// }

class UserData {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}

// {
//         "url": "https://reqres.in/#support-heading",
//         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
//     }

class SupportData {
  final String url;
  final String text;
  SupportData({
    required this.url,
    required this.text,
  });
  factory SupportData.fromJson(Map<String, dynamic> json) {
    return SupportData(
      url: json["url"] ?? "",
      text: json["text"] ?? "",
    );
  }
}
