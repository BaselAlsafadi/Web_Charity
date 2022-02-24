// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import '../../Constants/constants.dart';
import 'Beneficiaries.dart';
import 'DateTime_Widget.dart';
import 'Financial_Values.dart';
import 'Fund_balance.dart';

class Right_SideBar extends StatelessWidget {
  const Right_SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          DateTimeWidget(),
          SizedBox(
            height: 16,
          ),
          Fund_Balance(),
          SizedBox(
            height: 16,
          ),
          Financial_Values(),
          SizedBox(
            height: 16,
          ),
          Beneficiaries()
        ]));
  }
}
