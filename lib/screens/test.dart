// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:web_charity/Constants/api-connictin.dart';
// import 'package:web_charity/models/users.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   final TextEditingController nameee = TextEditingController();
//   final TextEditingController phoneee = TextEditingController();
//   final TextEditingController emailll = TextEditingController();
//   final TextEditingController passworddd = TextEditingController();
//   final TextEditingController natoinalll = TextEditingController();
//   final TextEditingController addressss = TextEditingController();
//   final TextEditingController adminnnn = TextEditingController();

//   String n = '';
//   String pho = '';
//   String ema = '';
//   String pass = '';
//   String natio = '';
//   String add = '';
//   String adm = '';

//   // The list that contains information about photos
//   List _loadedPhotos = [];

//   // The function that fetches data from the API
//   Future<void> _fetchData() async {
//     const API_URL = 'https://badaelonline.com/charity/public/api/users';

//     final response = await http.get(
//       Uri.parse(API_URL),
//       // headers: {
//       //   "Access-Control-Allow-Origin": "*",
//       //   "Access-Control-Allow-Headers":
//       //       "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//       //   "Access-Control-Allow-Methods": "POST, OPTIONS"
//       // }
//     );
//     final data = json.decode(response.body);

//     setState(() {
//       _loadedPhotos = data;
//     });
//   }

//   Future<void> adduserss(
//       // String name, String phone, String email,
//       //   String password, String national, String address, String admin
//       ) async {
//     // final API_URL = 'https://badaelonline.com/charity/public/api/addUser';

//     try {
//       final response = await http.post(
//           Uri.parse('https://badaelonline.com/charity/public/api/addUser'),
//           headers: {
//             "Accept": "application/json",
//             "Access-Control_Allow_Origin": "*"
//           },
//           body: {
//             'name': n,
//             'phone': pho,
//             'email': ema,
//             'password': pass,
//             'nationalId': natio,
//             'address': add,
//             'isAdmin': adm
//           });
//       print(response.body);
//     } catch (err) {
//       print(err);
//     }
//   }

//   void update() async {
//     final API_URL = 'https://badaelonline.com/charity/public/api/updateUser/';

//     final response = await http.put(Uri.parse(API_URL), body: {
//       'name': 'amal wisaam basel symo3a',
//       'phone': '095251487954',
//       'email': 'amal@123456',
//       'password': '123456',
//       'nationalId': '130100',
//       'address': 'syria',
//       'isAdmin': '1'
//     });
//     print(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//       Expanded(
//         child: _loadedPhotos.length == 0
//             ? Center(
//                 child: ElevatedButton(
//                   child: Text('Load Photos'),
//                   onPressed: _fetchData,
//                 ),
//               )
//             // The ListView that displays photos
//             : ListView.builder(
//                 itemCount: _loadedPhotos.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return ListTile(
//                     title: Text(_loadedPhotos[index]["name"]),
//                     subtitle:
//                         Text('Photo ID: ${_loadedPhotos[index]["phone"]}'),
//                   );
//                 },
//               ),
//       ),
//       Expanded(
//           child: Column(
//         children: [
//           TextFormField(
//             controller: nameee,
//             onChanged: (value) {
//               n = value;
//             },
//           ),
//           TextFormField(
//             controller: phoneee,
//             onChanged: (value) {
//               pho = value;
//             },
//           ),
//           TextFormField(
//             controller: emailll,
//             onChanged: (value) {
//               ema = value;
//             },
//           ),
//           TextFormField(
//             controller: passworddd,
//             onChanged: (value) {
//               pass = value;
//             },
//           ),
//           TextFormField(
//             controller: addressss,
//             onChanged: (value) {
//               add = value;
//             },
//           ),
//           TextFormField(
//             controller: adminnnn,
//             onChanged: (value) {
//               adm = value;
//             },
//           ),
//           TextFormField(
//             controller: natoinalll,
//             onChanged: (value) {
//               natio = value;
//             },
//           ),
//           InkWell(onTap: adduserss, child: Text('Add User'))
//         ],
//       ))
//     ]);
//   }
// }
