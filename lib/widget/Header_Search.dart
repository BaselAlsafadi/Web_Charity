// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class HeaderSearch extends StatefulWidget {
  String title;
  HeaderSearch({Key? key, required this.title}) : super(key: key);

  @override
  _HeaderSearchState createState() => _HeaderSearchState();
}

class _HeaderSearchState extends State<HeaderSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(widget.title)),
      Container(
        alignment: Alignment.center,
        width: 500,
        padding: const EdgeInsets.all(defaultPadding),
        child: TextField(
          decoration: InputDecoration(
              fillColor: secondaryColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              suffixIcon: InkWell(
                child: Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SvgPicture.asset('assets/icons/Search.svg'),
                ),
              )),
        ),
      ),
      Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(defaultPadding * 0.5),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Basel Alsafadi'),
              Container(
                width: 35,
                height: 35,
                decoration:
                    BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              ),
            ],
          )),
    ]);
  }
}
