// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:web_charity/Constants/constants.dart';

// ignore: camel_case_types
class Add_Donor extends StatelessWidget {
  final TextEditingController nationalId;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController location;
  final int edit;
  final Function() canceledit;
  final Function() editname;
  final Function() add;
  const Add_Donor(
      {Key? key,
      required this.edit,
      required this.canceledit,
      required this.editname,
      required this.nationalId,
      required this.name,
      required this.phone,
      required this.location,
      required this.add})
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
              TextField(
                controller: nationalId,
                decoration: const InputDecoration(
                  labelText: 'nationalId',
                ),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'name',
                ),
              ),
              TextField(
                controller: phone,
                decoration: const InputDecoration(
                  labelText: 'number',
                ),
              ),
              TextField(
                controller: location,
                decoration: const InputDecoration(
                  labelText: 'location',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              edit == 0
                  ? InkWell(
                      onTap: add,
                      child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber[400],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text('Add Donor')),
                    )
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
