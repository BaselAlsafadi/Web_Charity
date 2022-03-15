import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Users.dart';
import 'package:web_charity/widget/forget_password.dart';
import 'Main_Screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool texterrormail = false;
  bool texterrorpassword = false;
  bool _obscureText = true;

  int forget = 1;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/cover.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Email',
                          icon: const Icon(Icons.mail),
                          errorText:
                              texterrormail ? "Enter Correct email" : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          labelText: 'Enter Your Password',
                          suffixIcon: InkWell(
                            onTap: _toggle,
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          icon: const Icon(Icons.lock),
                          errorText: texterrorpassword
                              ? "Enter Correct Password"
                              : null,
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            forget = 0;
                          });
                        },
                        child: const Text('Forget password ?')),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (email.text.isEmpty) {
                          setState(() {
                            texterrormail = true;
                          });
                        } else {
                          setState(() {
                            texterrormail = false;
                          });
                        }
                        if (password.text.isEmpty) {
                          setState(() {
                            texterrorpassword = true;
                          });
                        } else {
                          setState(() {
                            texterrorpassword = false;
                          });
                        }
                        getAllUsers();

                        setState(() {
                          for (int i = 0; i < 10; i++) {
                            allUsers[i]["email"] == email.text ||
                                    allUsers[i]["password"] == password.text
                                ? Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          MainScreen(
                                        name: allUsers[i]["name"],
                                      ),
                                    ),
                                  )
                                : print(email.text);
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
                          child: const Text('LogIn')),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            forget == 0
                ? ForgetPassword(
                    Cancel: () {
                      setState(() {
                        forget = 1;
                      });
                    },
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
