// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

List allRevnues = [];

Future<void> getAllRevnues() async {
  const API_URL =
      'https://badaelonline.com/charity/public/api/revenuetransaction';

  final response = await http.get(
    Uri.parse(API_URL),
  );
  final data = json.decode(response.body);

  return allRevnues = data;
}

Future<void> addRevnue(
  String transactionNumber,
  String benefactors_id,
  String date,
  String value,
) async {
  try {
    final response = await http.post(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/addRevenuetransaction'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'transactionNumber': transactionNumber,
          'benefactors_id': benefactors_id,
          'date': date,
          'value': value,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

Future<void> deleteRevnue(int id) async {
  final response = await http.delete(
    Uri.parse(
        'https://badaelonline.com/charity/public/api/deleteRevenuetransaction/${id}'),
  );
}

Future<void> updateTransActionrevnue(int id, String transactionnumber,
    String benefactors_id, String date, String value) async {
  try {
    final response = await http.put(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/updateRevenuetransaction/${id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'transactionNumber': transactionnumber,
          'benefactors_id': benefactors_id,
          'date': date,
          'value': value,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

// int sum = 0;
// Future<void> collect() async {
//   for (int i = 0; i <= allRevnues.length; i++) {
//     sum = allRevnues[i]['value']++;
//     print(sum);
//   }
// }
