// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:web_charity/screens/secandpage.dart';
import 'package:web_charity/widget/Drawer_ListTile.dart';
import 'package:web_charity/widget/Header_Search.dart';
import 'package:web_charity/widget/RightSideBar/Right_SideBar.dart';
import '../Constants/constants.dart';
import 'HomePage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                    title: 'Analysis',
                    press: () {
                      setState(() {
                        tabIndex = 1;
                        title = 'Analysis Page';
                      });
                    },
                    image: 'assets/images/pie-chart.png',
                  ),
                  DrawerListTile(
                    title: 'Expenses',
                    press: () {
                      setState(() {
                        tabIndex = 2;
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
                    title: 'My Team',
                    press: () {
                      setState(() {
                        tabIndex = 4;
                        title = 'My Team Page';
                      });
                    },
                    image: 'assets/images/group.png',
                  ),
                  DrawerListTile(
                    title: 'Settings',
                    press: () {
                      setState(() {
                        tabIndex = 5;
                        title = 'Settings Page';
                      });
                    },
                    image: 'assets/images/settings.png',
                  ),
                  DrawerListTile(
                    title: 'Log Out',
                    press: () {},
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
                  HeaderSearch(title: title.toString()),
                  Flexible(
                    child: Container(
                      height: 1000,
                      child: tabIndex == 0
                          ? HomePage()
                          : tabIndex == 1
                              ? Scandpage()
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
