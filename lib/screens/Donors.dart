// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Benefactor.dart';
import 'package:web_charity/Services/Revnue_TransAction.dart';
import 'package:web_charity/widget/Card_User.dart';
import 'package:web_charity/widget/Donors/Recive.dart';
import 'package:web_charity/widget/Donors/add.dart';

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
  TextEditingController email = TextEditingController(text: 'ee');
  TextEditingController amount = TextEditingController();
  TextEditingController transActionNumber = TextEditingController();
  TextEditingController benefactors_id = TextEditingController();

  bool recive = false;
  int edit = 0;
  int id = 0;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('hh:mm a').format(now);
    String date = DateFormat('yyyy-MM-d').format(now);
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
                  Text(
                    'All Donors',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Spacer(),
                  Text(
                    "Total",
                    style: TextStyle(color: Colors.white54),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    allBenefactor.length.toString(),
                    style: TextStyle(color: Colors.white54),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 700,
                        height: 550,
                        child: FutureBuilder(
                            future: getAllBenefactor(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: allBenefactor.length,
                                itemBuilder: (context, itemcount) {
                                  return UserCard(
                                    color: greeen,
                                    ontap: () {
                                      setState(() {
                                        name.text =
                                            allBenefactor[itemcount]["name"];
                                        benefactors_id.text =
                                            allBenefactor[itemcount]["name"];
                                        recive = true;
                                      });
                                    },
                                    chek: 'recive',
                                    addres: allBenefactor[itemcount]["address"],
                                    id: itemcount + 1,
                                    name: allBenefactor[itemcount]["name"],
                                    number: allBenefactor[itemcount]["phone"],
                                    delete: () {
                                      setState(() {
                                        deleteBenefactor(
                                            allBenefactor[itemcount]["id"]);
                                        getAllBenefactor();
                                      });
                                    },
                                    edit: () {
                                      setState(() {
                                        edit = 1;

                                        id = allBenefactor[itemcount]["id"];
                                        nationalId.text =
                                            allBenefactor[itemcount]
                                                ["nationalId"];
                                        name.text =
                                            allBenefactor[itemcount]["name"];
                                        email.text = 'e';

                                        phone.text =
                                            allBenefactor[itemcount]["phone"];

                                        location.text = allBenefactor[itemcount]
                                                ["address"]
                                            .toString();
                                      });
                                    },
                                  );
                                },
                              );
                            }),
                      )),
                  Container(
                    width: 348,
                    height: 550,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        recive == true
                            ? Column(
                                children: [
                                  Recive(
                                    transactionNumber: transActionNumber,
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
                                        addRevnue(
                                          transActionNumber.text,
                                          benefactors_id.text,
                                          date,
                                          amount.text,
                                        );

                                        benefactors_id.clear();
                                        amount.clear();
                                        name.clear();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Add_D(
                                    add: () {},
                                    name: name,
                                    nationalId: nationalId,
                                    email: TextEditingController(text: 'eeeee'),
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
                                        updateBenefactor(
                                          id,
                                          nationalId.text,
                                          name.text,
                                          email.text,
                                          phone.text,
                                          location.text,
                                        );
                                        nationalId.clear();
                                        name.clear();
                                        phone.clear();
                                        location.clear();
                                      });
                                    },
                                    edit: edit,
                                  ),
                                ],
                              )
                            : Add_D(
                                add: () {
                                  setState(() {
                                    addBenefactor(
                                      nationalId.text,
                                      name.text,
                                      email.text,
                                      phone.text,
                                      location.text,
                                    );

                                    getAllBenefactor();
                                    nationalId.clear();
                                    name.clear();
                                    email.clear();
                                    phone.clear();
                                    email.clear();
                                    location.clear();
                                  });
                                },
                                email: email,
                                name: name,
                                nationalId: nationalId,
                                phone: phone,
                                location: location,
                                canceledit: () {
                                  setState(() {
                                    edit = 0;
                                    nationalId.clear();
                                    name.clear();
                                    email.clear();
                                    phone.clear();
                                    email.clear();
                                    location.clear();
                                  });
                                },
                                editname: () {
                                  setState(() {
                                    updateBenefactor(
                                      id,
                                      nationalId.text,
                                      name.text,
                                      email.text,
                                      phone.text,
                                      location.text,
                                    );
                                    getAllBenefactor();
                                    edit = 0;
                                    nationalId.clear();
                                    name.clear();
                                    email.clear();
                                    phone.clear();
                                    email.clear();
                                    location.clear();
                                  });
                                },
                                edit: edit,
                              ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
