// ignore_for_file: file_names, camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:web_charity/Services/Exchang_TransAction.dart';
import 'package:web_charity/Services/Revnue_TransAction.dart';
import '../../Constants/constants.dart';

class Financial_Values extends StatelessWidget {
  const Financial_Values({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Text('Total Revenue', style: TextStyle(color: Colors.white54)),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 44,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                totalRevenue.toString() + '    S.P',
                style: TextStyle(color: Color(0xff5BB949)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Total Expenses', style: TextStyle(color: Colors.white54)),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 44,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                totalExchang.toString() + '    S.P',
                style: TextStyle(color: Color(0xffEE3E31)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
