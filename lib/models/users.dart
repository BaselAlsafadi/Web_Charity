// import 'dart:convert';

// // List<Users> postFromJson(String str) =>
// //     List<Users>.from(json.decode(str).map((x) => Users.fromMap(x)));

// class Users {
//   Users({
//     required this.nationalId,
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.photo,
//     required this.address,
//     required this.isAdmin,
//     required this.created_at,
//     required this.updated_at,
//   });

//   String id;
//   String? nationalId;
//   String name;
//   String email;
//   String phone;
//   String photo;
//   String address;
//   int isAdmin;
//   String created_at;
//   String updated_at;

//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//         nationalId: json["nationalId"],
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         phone: json["phone"],
//         photo: json["photo"],
//         address: json["address"],
//         isAdmin: json["isAdmin"],
//         created_at: json["created_at"],
//         updated_at: json["updated_at"],
//       );
// }
