// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_charity/Constants/constants.dart';

// ignore: camel_case_types
class Recive extends StatelessWidget {
  final Function() cancel;
  final Function() recive;

  const Recive({
    Key? key,
    required this.cancel,
    required this.recive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('hh:mm a').format(now);
    String date = DateFormat('d/MM/yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: Container(
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(7)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(time),
                  Text(date),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'name',
                  // border: InputBorder.none,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'amount',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: cancel,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('cancel'),
                    ),
                  ),
                  InkWell(
                    onTap: recive,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Color(0xff5BB949),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('recive'),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
