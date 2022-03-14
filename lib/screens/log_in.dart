import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Users.dart';
import 'Main_Screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List emails = ['Basel@123,Rima@123,Walid@123,Komai@123'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: 500,
          height: 470,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset('assets/images/cover.jpg'),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Forget password ?'),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    getAllUsers();
                    emails.contains(email.text.toString()) ||
                            password.text == '123456'
                        ? Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const MainScreen(),
                            ),
                          )
                        : print(email);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('LogIn')),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
