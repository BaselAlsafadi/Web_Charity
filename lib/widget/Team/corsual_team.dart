// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_charity/Constants/constants.dart';
import 'package:web_charity/Services/Users.dart';

class Section_Team extends StatefulWidget {
  const Section_Team({Key? key}) : super(key: key);

  @override
  _Section_TeamState createState() => _Section_TeamState();
}

// ignore: camel_case_types
class _Section_TeamState extends State<Section_Team> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 250,
      height: 232,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: FutureBuilder(
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: CarouselSlider.builder(
                    itemCount: allUsers.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amber[400],
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(allUsers[itemIndex]["name"],
                                  style: TextStyle(color: Colors.white54)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                allUsers[itemIndex]["phone"],
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                )
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
                child: Container(
              height: MediaQuery.of(context).size.height / 50,
              width: MediaQuery.of(context).size.width / 4,
            ));
          }),
    );
  }
}
