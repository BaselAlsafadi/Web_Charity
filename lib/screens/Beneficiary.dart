// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Beneficiary.dart';
import 'package:web_charity/widget/Card_User.dart';
import 'package:web_charity/widget/Donors/Add_Donor.dart';
import 'package:web_charity/widget/Donors/Recive.dart';
import 'package:web_charity/widget/Team/Card_Team.dart';

class BeneficiaryScreen extends StatefulWidget {
  const BeneficiaryScreen({Key? key}) : super(key: key);

  @override
  _BeneficiaryScreenState createState() => _BeneficiaryScreenState();
}

class _BeneficiaryScreenState extends State<BeneficiaryScreen> {
  TextEditingController nationalId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController amount = TextEditingController();

  bool recive = false;
  int edit = 0;
  int id = 0;
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
                children: [
                  Text('All Beneficiary'),
                  Spacer(),
                  Text("total"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(allBeneficiary.length.toString())
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
                                  padding: EdgeInsets.all(8.0),
                                  child: FutureBuilder(
                                      future: getAllbeneficiary(),
                                      builder: (context, snapshot) {
                                        return ListView.builder(
                                          itemCount: allBeneficiary.length,
                                          itemBuilder: (context, itemcount) {
                                            return UserCard(
                                              color: reeed,
                                              ontap: () {
                                                setState(() {
                                                  name.text =
                                                      allBeneficiary[itemcount]
                                                          ["name"];
                                                  recive = true;
                                                });
                                              },
                                              chek: '  Pay  ',
                                              addres: allBeneficiary[itemcount]
                                                  ["address"],
                                              id: itemcount + 1,
                                              name: allBeneficiary[itemcount]
                                                  ["name"],
                                              number: allBeneficiary[itemcount]
                                                  ["phone"],
                                              delete: () {
                                                setState(() {
                                                  deleteBeneficiary(
                                                      allBeneficiary[itemcount]
                                                          ["id"]);
                                                  getAllbeneficiary();
                                                });
                                              },
                                              edit: () {
                                                setState(() {
                                                  edit = 1;

                                                  id = allBeneficiary[itemcount]
                                                      ["id"];
                                                  nationalId.text =
                                                      allBeneficiary[itemcount]
                                                          ["nationalId"];
                                                  name.text =
                                                      allBeneficiary[itemcount]
                                                          ["name"];
                                                  phone.text =
                                                      allBeneficiary[itemcount]
                                                          ["phone"];

                                                  location.text =
                                                      allBeneficiary[itemcount]
                                                              ["address"]
                                                          .toString();
                                                });
                                              },
                                            );
                                          },
                                        );
                                      }))))),
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
                                      chek: '  pay  ',
                                      color: reeed,
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
                                      add: () {
                                        setState(() {});
                                      },
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
                                  add: () {
                                    setState(() {
                                      addBeneficiary(
                                        nationalId.text,
                                        name.text,
                                        phone.text,
                                        location.text,
                                      );

                                      getAllbeneficiary();
                                      nationalId.clear();
                                      name.clear();
                                      phone.clear();
                                      location.clear();
                                    });
                                  },
                                  name: name,
                                  nationalId: nationalId,
                                  phone: phone,
                                  location: location,
                                  canceledit: () {
                                    setState(() {
                                      edit = 0;
                                      nationalId.clear();
                                      name.clear();
                                      phone.clear();

                                      location.clear();
                                    });
                                  },
                                  editname: () {
                                    setState(() {
                                      edit = 0;
                                      updateBeneficiary(
                                        id,
                                        nationalId.text,
                                        name.text,
                                        phone.text,
                                        location.text,
                                      );
                                      getAllbeneficiary();
                                      nationalId.clear();
                                      name.clear();
                                      phone.clear();

                                      location.clear();
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
