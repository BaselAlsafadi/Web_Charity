// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Exchang_TransAction.dart';
import 'package:web_charity/widget/Donors/Recive.dart';
import 'package:web_charity/widget/TransAction.dart';

class ExchangeTransaction extends StatefulWidget {
  const ExchangeTransaction({Key? key}) : super(key: key);

  @override
  State<ExchangeTransaction> createState() => _ExchangeTransactionState();
}

class _ExchangeTransactionState extends State<ExchangeTransaction> {
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
                  Text('All Exchanges'),
                  Spacer(),
                  Text("Total"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(allExchanges.length.toString())
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
                                    future: getAllExchang(),
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                        itemCount: allExchanges.length,
                                        itemBuilder: (context, itemcount) {
                                          return TransAction(
                                            color: reeed,
                                            delete: () {
                                              setState(() {
                                                deleteExchang(
                                                  allExchanges[itemcount]["id"],
                                                );
                                                getAllExchang();
                                              });
                                            },
                                            update: () {
                                              setState(() {
                                                id = allExchanges[itemcount]
                                                    ["id"];
                                                name.text =
                                                    allExchanges[itemcount]
                                                        ["beneficiary_id"];
                                                amount.text =
                                                    allExchanges[itemcount]
                                                            ["value"]
                                                        .toString();
                                                transactionNumber.text =
                                                    allExchanges[itemcount][
                                                            "transactionNumber"]
                                                        .toString();
                                              });
                                            },
                                            name: allExchanges[itemcount]
                                                ["beneficiary_id"],
                                            amount: allExchanges[itemcount]
                                                ["value"],
                                            address:
                                                "Syria - Alswaida - Alkafer",
                                            date: allExchanges[itemcount]
                                                    ["date"]
                                                .toString(),
                                            transactionNumber:
                                                allExchanges[itemcount]
                                                    ["transactionNumber"],
                                            number: '0930253884',
                                          );
                                        },
                                      );
                                    })))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(children: [
                        Recive(
                          transactionNumber: transactionNumber,
                          name: name,
                          amount: amount,
                          chek: 'update',
                          color: reeed,
                          cancel: () {
                            setState(() {});
                            amount.clear();
                            name.clear();
                            transactionNumber.clear();
                          },
                          recive: () {
                            setState(() {
                              updateTransActionExchange(
                                id,
                                transactionNumber.text,
                                name.text,
                                date,
                                amount.text,
                              );
                              getAllExchang();
                            });
                            amount.clear();
                            name.clear();
                            transactionNumber.clear();
                          },
                        )
                      ]))
                ],
              )
            ],
          ),
        ));
  }
}
