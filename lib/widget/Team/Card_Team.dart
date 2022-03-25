// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

class CardTeam extends StatelessWidget {
  final Function() edit;
  final Function() delete;
  final String name;
  final String phone;
  final String idlist;
  const CardTeam({
    Key? key,
    required this.delete,
    required this.edit,
    required this.name,
    required this.phone,
    required this.idlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber[400],
            child: Text(idlist),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white54),
              ),
              Row(
                children: [
                  Text(
                    phone,
                    style: TextStyle(color: Colors.white54),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: delete,
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.white54,
                    ),
                  ),
                ],
              )
            ],
          ),
          subtitle: const Text('Admin'),
          trailing: InkWell(
            onTap: edit,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.amber[400],
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '  edit  ',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
