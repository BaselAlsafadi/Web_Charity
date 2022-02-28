// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/widget/Team/Add_Team.dart';
import 'package:web_charity/widget/Team/Card_Team.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({Key? key}) : super(key: key);

  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  int edit = 0;
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
                children: const [Text('All Team'), Spacer(), Text("total 5")],
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
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CardTeam(
                                  delete: () {
                                    setState(() {
                                      // recive = true;
                                    });
                                  },
                                  edit: () {
                                    setState(() {
                                      edit = 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )))),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Add_Team(
                            canceledit: () {
                              setState(() {
                                edit = 0;
                              });
                            },
                            editname: () {
                              setState(() {
                                edit = 0;
                              });
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
