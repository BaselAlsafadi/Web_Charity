// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

List allUsers = [];

Future<void> getAllUsers() async {
  const API_URL = 'https://badaelonline.com/charity/public/api/users';

  final response = await http.get(
    Uri.parse(API_URL),
  );
  final data = json.decode(response.body);

  return allUsers = data;
}

Future<void> deleteUser(int id) async {
  const API_URL = 'https://badaelonline.com/charity/public/api/users';

  final response = await http.delete(
    Uri.parse('https://badaelonline.com/charity/public/api/deleteUser/${id}'),
  );
}

Future<void> updateUser(int id, String name, String phone, String email,
    String password, String nationalid, String address, String isadmin) async {
  try {
    final response = await http.put(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/updateUser/${id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'photo': password,
          'nationalId': nationalid,
          'address': address,
          'isAdmin': isadmin
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

Future<void> addUser(String name, String phone, String email, String password,
    String nationalid, String address, String isadmin) async {
  try {
    final response = await http.post(
        Uri.parse('https://badaelonline.com/charity/public/api/addUser'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'photo': password,
          'nationalId': nationalid,
          'address': address,
          'isAdmin': isadmin
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}
