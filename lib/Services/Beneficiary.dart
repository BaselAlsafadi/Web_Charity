// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

List allBeneficiary = [];

Future<void> getAllbeneficiary() async {
  const API_URL = 'https://badaelonline.com/charity/public/api/beneficiary';

  final response = await http.get(
    Uri.parse(API_URL),
  );
  final data = json.decode(response.body);

  return allBeneficiary = data;
}

Future<void> addBeneficiary(
    String nationalid, String name, String phone, String address) async {
  try {
    final response = await http.post(
        Uri.parse('https://badaelonline.com/charity/public/api/addBeneficiary'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'nationalId': nationalid,
          'name': name,
          'phone': phone,
          'address': address,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

Future<void> deleteBeneficiary(int id) async {
  final response = await http.delete(
    Uri.parse(
        'https://badaelonline.com/charity/public/api/deleteBeneficiary/${id}'),
  );
}

Future<void> updateBeneficiary(int id, String nationalid, String name,
    String phone, String address) async {
  try {
    final response = await http.put(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/updateBeneficiary/${id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'nationalId': nationalid,
          'name': name,
          'phone': phone,
          'address': address,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}
