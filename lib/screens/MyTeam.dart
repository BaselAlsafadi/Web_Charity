// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_charity/Services/Users.dart';

import 'package:web_charity/widget/Team/Add_Team.dart';
import 'package:web_charity/widget/Team/Card_Team.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({
    Key? key,
  }) : super(key: key);

  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  TextEditingController nationalId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController isadmin = TextEditingController();
  TextEditingController location = TextEditingController();
  int edit = 0;
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                children: [
                  Text('All Team'),
                  Spacer(),
                  Row(
                    children: [
                      Text('Total'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(allUsers.length.toString()),
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 575,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Flexible(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FutureBuilder(
                                  future: getAllUsers(),
                                  builder: (context, snapshot) {
                                    return ListView.builder(
                                      itemCount: allUsers.length,
                                      itemBuilder: (context, itemcount) {
                                        return CardTeam(
                                          idlist: '${itemcount + 1}',
                                          name: allUsers[itemcount]["name"],
                                          phone: allUsers[itemcount]["phone"],
                                          delete: () {
                                            setState(() {
                                              deleteUser(
                                                  allUsers[itemcount]["id"]);
                                            });
                                            getAllUsers();
                                          },
                                          edit: () {
                                            setState(() {
                                              edit = 1;
                                              id = allUsers[itemcount]["id"];
                                              nationalId.text =
                                                  allUsers[itemcount]
                                                      ["nationalId"];
                                              name.text =
                                                  allUsers[itemcount]["name"];
                                              phone.text =
                                                  allUsers[itemcount]["phone"];
                                              isadmin.text = allUsers[itemcount]
                                                      ["isAdmin"]
                                                  .toString();

                                              email.text = allUsers[itemcount]
                                                      ["email"]
                                                  .toString();
                                              password.text =
                                                  allUsers[itemcount]["photo"]
                                                      .toString();

                                              location.text =
                                                  allUsers[itemcount]["address"]
                                                      .toString();
                                            });
                                          },
                                        );
                                      },
                                    );
                                  })),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Add_Team(
                            nationalId: nationalId,
                            name: name,
                            phone: phone,
                            isadmin: isadmin,
                            email: email,
                            password: password,
                            location: location,
                            add: () {
                              setState(() {
                                addUser(
                                    name.text,
                                    phone.text,
                                    email.text,
                                    password.text,
                                    nationalId.text,
                                    location.text,
                                    isadmin.text);
                                getAllUsers();
                                nationalId.clear();
                                name.clear();
                                phone.clear();
                                password.clear();
                                location.clear();
                                isadmin.clear();
                                email.clear();
                              });
                            },
                            canceledit: () {
                              setState(() {
                                edit = 0;
                                nationalId.clear();
                                name.clear();
                                phone.clear();
                                password.clear();
                                location.clear();
                                isadmin.clear();
                                email.clear();
                              });
                            },
                            editname: () {
                              setState(() {
                                edit = 0;
                                updateUser(
                                    id,
                                    name.text,
                                    phone.text,
                                    email.text,
                                    password.text,
                                    nationalId.text,
                                    location.text,
                                    isadmin.text);
                              });
                              getAllUsers();
                              nationalId.clear();
                              name.clear();
                              phone.clear();
                              password.clear();
                              location.clear();
                              isadmin.clear();
                              email.clear();
                            },
                            edit: edit,
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
