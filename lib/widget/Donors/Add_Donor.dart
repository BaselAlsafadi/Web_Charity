// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

// ignore: camel_case_types
class Add_Donor extends StatelessWidget {
  final int edit;
  final Function() canceledit;
  final Function() editname;
  const Add_Donor(
      {Key? key,
      required this.edit,
      required this.canceledit,
      required this.editname})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: Container(
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(7)),
            child: Column(children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'name',
                  // border: InputBorder.none,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'number',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'location',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              edit == 0
                  ? Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('Add Donor'))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: canceledit,
                          child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('cancel')),
                        ),
                        InkWell(
                          onTap: editname,
                          child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text('edit')),
                        )
                      ],
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
