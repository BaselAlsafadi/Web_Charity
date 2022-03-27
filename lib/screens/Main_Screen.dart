// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:web_charity/Services/Users.dart';
import 'package:web_charity/screens/analysis.dart';
import 'package:web_charity/screens/log_in.dart';
import 'package:web_charity/widget/Drawer_ListTile.dart';
import 'package:web_charity/widget/Header_Search.dart';
import 'package:web_charity/widget/RightSideBar/Right_SideBar.dart';
import '../Constants/constants.dart';
import 'Beneficiary.dart';
import 'Donors.dart';
import 'Exchange_Transaction.dart';
import 'HomePage.dart';
import 'MyTeam.dart';
import 'Revnue_Transaction.dart';

class MainScreen extends StatefulWidget {
  final String name;

  MainScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabIndex = 0;
  String title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(children: [
                  DrawerHeader(
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 85,
                            width: 85,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.asset('assets/images/LOGO.png')),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Charity',
                          style: TextStyle(color: Colors.white54, fontSize: 16),
                        )
                      ],
                    ),
                  )),
                  DrawerListTile(
                    title: 'Home Page',
                    press: () {
                      setState(() {
                        tabIndex = 0;
                        title = 'Home Page';
                      });
                    },
                    image: 'assets/images/home.png',
                  ),
                  DrawerListTile(
                    title: 'Expenses',
                    press: () {
                      setState(() {
                        tabIndex = 1;
                        title = 'Expenses Page';
                      });
                    },
                    image: 'assets/images/expenses.png',
                  ),
                  DrawerListTile(
                    title: 'Revenue',
                    press: () {
                      setState(() {
                        tabIndex = 3;
                        title = 'Revenue Page';
                      });
                    },
                    image: 'assets/images/revenue.png',
                  ),
                  DrawerListTile(
                    title: 'Donors',
                    press: () {
                      setState(() {
                        tabIndex = 4;
                        title = 'Donors Page';
                      });
                    },
                    image: 'assets/images/donors.png',
                  ),
                  DrawerListTile(
                    title: 'Beneficiaries',
                    press: () {
                      setState(() {
                        tabIndex = 5;
                        title = 'Beneficiaries page';
                      });
                    },
                    image: 'assets/images/group.png',
                  ),
                  DrawerListTile(
                    title: 'Analysis',
                    press: () {
                      setState(() {
                        tabIndex = 8;
                        title = 'Analysis Page';
                      });
                    },
                    image: 'assets/images/pie-chart.png',
                  ),
                  DrawerListTile(
                    title: 'My Team',
                    press: () {
                      setState(() {
                        tabIndex = 6;
                        title = 'My Team Page';
                        getAllUsers();
                      });
                    },
                    image: 'assets/images/team.png',
                  ),
                  DrawerListTile(
                    title: 'Log Out',
                    press: () {
                      setState(() {
                        tabIndex = 50;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const LogInScreen(),
                        ),
                      );
                    },
                    image: 'assets/images/logout.png',
                  ),
                ]),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                top: defaultPadding,
                bottom: defaultPadding,
              ),
              child: Column(
                children: [
                  HeaderSearch(
                    title: title.toString(),
                    name: widget.name,
                  ),
                  Flexible(
                    child: Container(
                      height: 1000,
                      child: tabIndex == 0
                          ? HomePage()
                          : tabIndex == 1
                              ? ExchangeTransaction()
                              : tabIndex == 3
                                  ? RevnueTransaction()
                                  : tabIndex == 4
                                      ? DonorsScreen()
                                      : tabIndex == 6
                                          ? MyTeam()
                                          : tabIndex == 8
                                              ? Analysis()
                                              : tabIndex == 5
                                                  ? BeneficiaryScreen()
                                                  : HomePage(),
                    ),
                  )
                ],
              ),
            )),
        Expanded(
          flex: 1,
          child: Right_SideBar(),
        )
      ]),
    ));
  }
}
