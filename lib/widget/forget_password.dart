import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Users.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String password = '1';
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        width: 500,
        height: 500,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text('Enter your National Id'),
            TextField(
              controller: passController,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < 10; i++) {
                      allUsers[i]["nationalId"] == passController.text
                          ? password = allUsers[3]["password"]
                          : password = 'no data';
                    }
                  });
                },
                child: Text('get password')),
            Text(password)
          ],
        ),
      ),
    );
  }
}
