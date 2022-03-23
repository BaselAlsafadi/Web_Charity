import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Users.dart';

class ForgetPassword extends StatefulWidget {
  final Function()? Cancel;
  const ForgetPassword({
    Key? key,
    this.Cancel,
  }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? password;
  int show = 0;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: widget.Cancel, icon: const Icon(Icons.cancel))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Icon(
                Icons.admin_panel_settings_rounded,
                size: 60,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Dear user , to get your password :',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '1 - please enter your national id.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '2 - press buttom get password.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: passController,
                  decoration:
                      const InputDecoration(labelText: 'Enter National Id'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      getAllUsers();
                      show = 1;
                      for (int i = 0; i < allUsers.length; i++) {
                        allUsers[i]["nationalId"] == passController.text
                            ? password = (allUsers[i]["photo"])
                            : print(i);
                      }
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('get password'))),
              const SizedBox(
                height: 45,
              ),
              show == 1
                  ? Column(
                      children: [
                        const Text(
                          'Your Password is',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            password.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  : const Text('')
            ],
          ),
        ),
      ),
    );
  }
}
