// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

class TransAction extends StatelessWidget {
  final String transactionNumber;
  final Color color;
  final String date;
  final String name;
  final String number;
  final String address;
  final int amount;
  final Function() delete;
  final Function() update;

  const TransAction({
    Key? key,
    required this.transactionNumber,
    required this.color,
    required this.date,
    required this.name,
    required this.number,
    required this.address,
    required this.amount,
    required this.delete,
    required this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        height: 135,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 75,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                      )),
                  child: Text(transactionNumber),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 25,
                  child: Text(date),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: update,
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: delete,
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Divider(
                thickness: 1,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(name)
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: greeen,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('0930253884')
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Syria-Swida-Alkafaer')
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: Image.asset('assets/images/dollar.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(amount.toString()),
                              SizedBox(
                                width: 5,
                              ),
                              Text('S.P')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
