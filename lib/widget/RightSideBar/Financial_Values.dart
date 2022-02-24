// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import '../../Constants/constants.dart';

class Financial_Values extends StatelessWidget {
  const Financial_Values({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 250,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Text('Fund Balance'),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text('100.000.000  S.P',
                  style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Fund Balance', style: TextStyle(color: Colors.white54)),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                '100.000.000  S.P',
                style: TextStyle(color: Color(0xff5BB949)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Fund Balance'),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Text(
                '100.000.000  S.P',
                style: TextStyle(color: Color(0xffEE3E31)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
