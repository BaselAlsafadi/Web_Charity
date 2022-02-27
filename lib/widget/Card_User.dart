// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

class UserCard extends StatelessWidget {
  final Function() edit;
  final Function() ontap;
  const UserCard({
    Key? key,
    required this.ontap,
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
            Text('Basel Alsafadi'),
            Text('00963930253884'),
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
                Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.amber[400]!,
                )
              ],
            )
          ],
        ),
        subtitle: const Text('Syria'),
        trailing: InkWell(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xff5BB949),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'Receive',
            ),
          ),
        ),
      ),
    );
  }
}
