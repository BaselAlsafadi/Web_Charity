// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Services/Benefactor.dart';
import 'package:web_charity/Services/Beneficiary.dart';
import 'package:web_charity/Services/Exchang_TransAction.dart';
import 'package:web_charity/Services/Revnue_TransAction.dart';
import 'package:web_charity/Services/Users.dart';
import 'package:web_charity/Widget/Donors/Corsual_Beneficaries.dart';
import 'package:web_charity/Widget/Donors/corsual_donors.dart';
import 'package:web_charity/Widget/Team/corsual_team.dart';
import '../Constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 125,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "My Team  " + allUsers.length.toString(),
                          style: TextStyle(color: Colors.amber[400]),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Section_Team(),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 125,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Donors  ' + allBenefactor.length.toString(),
                          style: TextStyle(color: greeen),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Section_Donors()
                  ],
                ),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 125,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Beneficiaries  ' + allBeneficiary.length.toString(),
                          style: TextStyle(color: reeed),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Section_Beneficaries()
                  ],
                )
              ],
            ),
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              child: Divider(
                color: bgColor,
                thickness: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Fund Balance ", style: TextStyle(color: Colors.blue)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          (totalRevenue - totalExchang).toString() + "    S.P",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Total Revenues',
                      style: TextStyle(color: greeen),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(totalRevenue.toString() + "    S.P",
                            style: TextStyle(color: greeen))),
                    SizedBox(
                      height: 16,
                    ),
                    Icon(
                      Icons.arrow_circle_down_rounded,
                      size: 35,
                      color: greeen,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        allRevnues.length.toString() + "  Person",
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Total Exchanges',
                      style: TextStyle(color: reeed),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          totalExchang.toString() + "    S.P",
                          style: TextStyle(color: reeed),
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    Icon(
                      Icons.arrow_circle_down_rounded,
                      size: 35,
                      color: reeed,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        allExchanges.length.toString() + "  Person",
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
