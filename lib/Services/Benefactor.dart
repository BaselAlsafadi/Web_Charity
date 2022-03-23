// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

List allBenefactor = [];

Future<void> getAllBenefactor() async {
  const API_URL = 'https://badaelonline.com/charity/public/api/benefactor';

  final response = await http.get(
    Uri.parse(API_URL),
  );
  final data = json.decode(response.body);

  return allBenefactor = data;
}

Future<void> addBenefactor(String nationalid, String name, String email,
    String phone, String address) async {
  try {
    final response = await http.post(
        Uri.parse('https://badaelonline.com/charity/public/api/addBenefactor'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'nationalId': nationalid,
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

Future<void> deleteBenefactor(int id) async {
  final response = await http.delete(
    Uri.parse(
        'https://badaelonline.com/charity/public/api/deleteBenefactor/${id}'),
  );
}

Future<void> updateBenefactor(int id, String nationalid, String name,
    String email, String phone, String address) async {
  try {
    final response = await http.put(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/updateBenefactor/${id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'nationalId': nationalid,
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}
