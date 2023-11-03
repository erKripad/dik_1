//----------------------------------------------------------------------------//

// framework
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:dik/Theme/Widgets/title1.dart';
import 'package:dik/Theme/Widgets/title2.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/Widgets/Buttons/hype_button.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/selected_page.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

//import 'dart:async';

//----------------------------------------------------------------------------//

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.date,
    required this.place,
    required this.time,
    required this.price,
    required this.category,
    required this.image,
    //required this.onTapDestination,
  }) : super(key: key);

  final String category;
  final String date;
  final String image;
  final String place;
  final int price;
  final String time;
  final String title;

  //final String onTapDestination;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  _getRequests() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(
                    MaterialPageRoute(builder: (_) => const SelectedPage()),
                  )
                  .then((val) => {_getRequests()}),

              /*() => Future.microtask(
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: false,
                          builder: (context) => const SelectedPage()));
                },
              ).then((val) => {_getRequests()}),
              onDoubleTap: () {
                hyped == true
                    ? setState(() {
                        hyped = false;
                      })
                    : setState(() {
                        hyped = true;
                      });
              },
              },*/

              child: Container(
                height: screenwidth * 120 / 100,
                decoration: const BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                padding: EdgeInsets.all(screenwidth * 5 / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenwidth * 88 / 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image(
                            image: AssetImage(widget.image), fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Title2(
                                title: widget.title,
                                color: primaryPurple,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    widget.category,
                                    height: screenheight * 4 / 100,
                                    width: screenheight * 4 / 100,
                                    // ignore: deprecated_member_use
                                    color: iconColor,
                                  ),
                                  SizedBox(width: screenwidth * 2 / 100),
                                  const Text2(
                                    title: "·",
                                    color: textColor,
                                  ),
                                  SizedBox(width: screenwidth * 2 / 100),
                                  Text2(
                                    title: widget.date,
                                    color: textColor,
                                  ),
                                  SizedBox(width: screenwidth * 2 / 100),
                                  const Text2(
                                    title: "·",
                                    color: textColor,
                                  ),
                                  SizedBox(width: screenwidth * 2 / 100),
                                  Text2(
                                    title: widget.time,
                                    color: textColor,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text2(
                                title: widget.place,
                                color: textColor,
                              ),
                            ],
                          ),
                          eventButtons(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: screenheight * 2 / 100,
      )
    ]);
  }

  Widget eventButtons(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          height: screenwidth * 10 / 100,
          width: screenwidth * 14 / 100,
          decoration: const BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text2(
              title: "$price\$",
              color: primaryPurple,
              bold: true,
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: screenwidth * 10 / 100,
          width: screenwidth * 14 / 100,
          decoration: const BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ButtonHype(
            hyped: hyped,
            selectedColor: primaryPurple,
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------------------------------//