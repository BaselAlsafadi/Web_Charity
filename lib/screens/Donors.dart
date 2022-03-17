// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/widget/Donors/Add_Donor.dart';
import 'package:web_charity/widget/Donors/Recive.dart';

class DonorsScreen extends StatefulWidget {
  const DonorsScreen({Key? key}) : super(key: key);

  @override
  _DonorsScreenState createState() => _DonorsScreenState();
}

class _DonorsScreenState extends State<DonorsScreen> {
  TextEditingController nationalId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController amount = TextEditingController();

  bool recive = false;
  int edit = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('All Donors'),
                  Spacer(),
                  Text("total 152")
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
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // UserCard(
                                //   name: 'Basel Alsafadi',
                                //   number: '00963930253884',
                                //   ontap: () {
                                //     setState(() {
                                //       recive = true;
                                //     });
                                //   },
                                //   edit: () {
                                //     setState(() {
                                //       edit = 1;
                                //     });
                                //   },
                                // ),
                              ],
                            ),
                          )))),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          recive == true
                              ? Column(
                                  children: [
                                    Recive(
                                      name: name,
                                      amount: amount,
                                      chek: 'recive',
                                      color: greeen,
                                      cancel: () {
                                        setState(() {
                                          recive = false;
                                        });
                                      },
                                      recive: () {
                                        setState(() {
                                          recive = false;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Add_Donor(
                                      add: () {},
                                      name: name,
                                      nationalId: nationalId,
                                      phone: phone,
                                      location: location,
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
                                )
                              : Add_Donor(
                                  add: () {},
                                  name: name,
                                  nationalId: nationalId,
                                  phone: phone,
                                  location: location,
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
