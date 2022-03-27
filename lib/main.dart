import 'package:flutter/material.dart';
import 'Constants/constants.dart';
import 'Services/Benefactor.dart';
import 'Services/Beneficiary.dart';
import 'Services/Exchang_TransAction.dart';
import 'Services/Revnue_TransAction.dart';
import 'Services/Users.dart';
import 'screens/log_in.dart';

void main() {
  runApp(const MyApp());
  getAllUsers();
  getAllExchang();
  getAllRevnues();
  getAllBenefactor();
  getAllbeneficiary();
  getExchang();
  getRevenue();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Charity',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      home: const LogInScreen(),
    );
  }
}
