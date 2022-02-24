// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import '../../Constants/constants.dart';
import 'DateTime_Widget.dart';
import 'Financial_Values.dart';

class Right_SideBar extends StatelessWidget {
  const Right_SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
          DateTimeWidget(),
          SizedBox(
            height: 16,
          ),
          Financial_Values()
        ]));
  }
}
