// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

class CardTeam extends StatelessWidget {
  final Function() edit;
  final Function() delete;
  const CardTeam({
    Key? key,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      height: 60,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber[400],
          child: const Text('1'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Walid Hnidi'),
            Text('0930253884'),
            InkWell(
              onTap: delete,
              child: Icon(
                Icons.delete,
                size: 20,
                color: Colors.white54,
              ),
            ),
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
    );
  }
}
