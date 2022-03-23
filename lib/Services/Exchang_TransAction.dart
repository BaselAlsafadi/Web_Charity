// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

List allExchanges = [];

Future<void> getAllExchang() async {
  const API_URL =
      'https://badaelonline.com/charity/public/api/exchangetransaction';

  final response = await http.get(
    Uri.parse(API_URL),
  );
  final data = json.decode(response.body);

  return allExchanges = data;
}

Future<void> addExchang(
  String transactionNumber,
  String beneficiary_id,
  String date,
  String value,
) async {
  try {
    final response = await http.post(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/addExchangetransaction'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'transactionNumber': transactionNumber,
          'beneficiary_id': beneficiary_id,
          'date': date,
          'value': value,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}

Future<void> deleteExchang(int id) async {
  final response = await http.delete(
    Uri.parse(
        'https://badaelonline.com/charity/public/api/deleteExchangetransaction/${id}'),
  );
}

Future<void> updateTransActionExchange(int id, String transactionnumber,
    String beneficiary_id, String date, String value) async {
  try {
    final response = await http.put(
        Uri.parse(
            'https://badaelonline.com/charity/public/api/updateExchangetransaction/${id}'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {
          'transactionNumber': transactionnumber,
          'beneficiary_id': beneficiary_id,
          'date': date,
          'value': value,
        });
    print(response.body);
  } catch (err) {
    print(err);
  }
}
