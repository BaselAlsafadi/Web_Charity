// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

class UserCard extends StatelessWidget {
  final Function() edit;
  final Function() ontap;
  final Function() delete;
  final String name;
  final String addres;
  final String number;
  final String chek;
  final int id;
  final Color color;
  const UserCard({
    Key? key,
    required this.ontap,
    required this.edit,
    required this.name,
    required this.number,
    required this.addres,
    required this.color,
    required this.id,
    required this.chek,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber[400],
            child: Text('$id'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Text(number),
              Row(
                children: [
                  InkWell(
                    onTap: edit,
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: delete,
                    child: Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.amber[400]!,
                    ),
                  )
                ],
              )
            ],
          ),
          subtitle: Text(addres),
          trailing: InkWell(
            onTap: ontap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              child: Text(chek),
            ),
          ),
        ),
      ),
    );
  }
}
