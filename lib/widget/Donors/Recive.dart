// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_charity/Constants/constants.dart';

// ignore: camel_case_types
class Recive extends StatelessWidget {
  final Function() cancel;
  final Function() recive;
  final Color color;
  final String chek;
  final TextEditingController amount;
  final TextEditingController name;

  Recive({
    Key? key,
    required this.cancel,
    required this.recive,
    required this.color,
    required this.chek,
    required this.amount,
    required this.name,
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
              TextField(
                controller: name,
                readOnly: true,
                decoration: InputDecoration(labelText: 'name'),
              ),
              TextField(
                controller: amount,
                decoration: InputDecoration(
                  labelText: 'amount',
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
                        color: color,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(chek),
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
