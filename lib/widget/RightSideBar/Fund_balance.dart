// ignore_for_file: file_names, camel_case_types, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:web_charity/Services/Exchang_TransAction.dart';
import 'package:web_charity/Services/Revnue_TransAction.dart';
import '../../Constants/constants.dart';

class Fund_Balance extends StatelessWidget {
  const Fund_Balance({
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
            Text('Fund Balance', style: TextStyle(color: Colors.white54)),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 44,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text((totalRevenue - totalExchang).toString() + '    S.P',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
