// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Exchang_TransAction.dart';
import 'package:web_charity/Services/Revnue_TransAction.dart';
import 'package:web_charity/widget/Donors/Recive.dart';
import 'package:web_charity/widget/TransAction.dart';

class RevnueTransaction extends StatefulWidget {
  const RevnueTransaction({Key? key}) : super(key: key);

  @override
  State<RevnueTransaction> createState() => _RevnueTransactionState();
}

class _RevnueTransactionState extends State<RevnueTransaction> {
  TextEditingController nationalId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController transactionNumber = TextEditingController();

  int edit = 0;
  int id = 0;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-d').format(now);
    return Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Container(
          color: secondaryColor,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'All Revnues',
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
                    allRevnues.length.toString(),
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
                            future: getAllRevnues(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: allRevnues.length,
                                itemBuilder: (context, itemcount) {
                                  return TransAction(
                                    color: greeen,
                                    delete: () {
                                      setState(() {
                                        deleteRevnue(
                                          allRevnues[itemcount]["id"],
                                        );
                                        getAllRevnues();
                                        getRevenue();
                                      });
                                    },
                                    update: () {
                                      setState(() {
                                        id = allRevnues[itemcount]["id"];
                                        name.text = allRevnues[itemcount]
                                            ["benefactors_id"];
                                        amount.text = allRevnues[itemcount]
                                                ["value"]
                                            .toString();
                                        transactionNumber.text =
                                            allRevnues[itemcount]
                                                    ["transactionNumber"]
                                                .toString();
                                      });
                                      getRevenue();
                                    },
                                    name: allRevnues[itemcount]
                                        ["benefactors_id"],
                                    amount: allRevnues[itemcount]["value"],
                                    address: "Syria - Alswaida - Alkafer",
                                    date: allRevnues[itemcount]["date"]
                                        .toString(),
                                    transactionNumber: allRevnues[itemcount]
                                        ["transactionNumber"],
                                    number: '0930253884',
                                  );
                                },
                              );
                            }),
                      )),
                  Container(
                    width: 348,
                    height: 265,
                    child: Recive(
                      transactionNumber: transactionNumber,
                      name: name,
                      amount: amount,
                      chek: 'update',
                      color: greeen,
                      cancel: () {
                        setState(() {});
                        amount.clear();
                        name.clear();
                        transactionNumber.clear();
                      },
                      recive: () {
                        setState(() {
                          updateTransActionrevnue(
                            id,
                            transactionNumber.text,
                            name.text,
                            date,
                            amount.text,
                          );
                          getAllRevnues();
                        });
                        amount.clear();
                        name.clear();
                        transactionNumber.clear();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
