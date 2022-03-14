// // ignore_for_file: file_names

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:web_charity/models/album.dart';
// import 'package:web_charity/models/users.dart';

// // Future<List<Users>> fetchUsers() async {
// //   final response = await http.get(
// //       Uri.parse('https://badaelonline.com/charity/public/api/users'),
// //       headers: {
// //         "Access-Control-Allow-Origin": "*",
// //         "Access-Control-Allow-Headers":
// //             "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
// //         "Access-Control-Allow-Methods": "POST, OPTIONS"
// //       });

// //   if (response.statusCode == 200) {
// //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //     return parsed.map<Users>((json) => Post.fromMap(json)).toList();
// //   } else {
// //     throw Exception('Failed to load album');
// //   }
// // }

// List<Users> parseProducts(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Users>((json) => Users.fromJson(json)).toList();
// }

// Future<List<Users>> fetchProducts() async {
//   final response = await http
//       .get(Uri.parse('https://badaelonline.com/charity/public/api/users'));
//   if (response.statusCode == 200) {
//     return parseProducts(response.body);
//   } else {
//     throw Exception('Unable to fetch products from the REST API');
//   }
// }

// ///////add user
// Future<Users> addUser(
//     String name, String phone, String email, String password) async {
//   final response = await http.post(
//     Uri.parse('https://badaelonline.com/charity/public/api/addUser'),
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': name,
//       'phone': phone,
//       'email': email,
//       'password': password,
//     }),
//   );

//   if (response.statusCode < 200 || response.statusCode >= 400) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Users.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

// Future<List<Post>> fetchPost() async {
//   final response =
//       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//     return parsed.map<Post>((json) => Post.fromMap(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
