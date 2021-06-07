import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../List.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({Key? key}) : super(key: key);

  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.heightBox,
            "Home Feed".text.white.size(35).make(),
            20.heightBox,
            (accha.isEmpty)
                ? Container(
              height: MediaQuery.of(context).size.height*0.75,
                    child: Center(
                      child: "Welcome Create New Posts".text.bold.white.make(),
                    ),
                  )
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: accha.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  //padding: EdgeInsets.all(10),
                                  child: Container(
                                    //height: 100,
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(300.0),
                                              child: Image.asset(
                                                "res/accha.jpg",
                                                scale: 60,
                                                // height: 50,
                                                // width: 50,
                                              ),
                                            ),
                                            5.widthBox,
                                            "Anonymous"
                                                .text
                                                .size(17)
                                                .black
                                                .make()
                                          ],
                                        ),
                                        10.heightBox,
                                        Container(
                                          // height: 100,
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: accha[index]
                                              .text
                                              .size(17)
                                              .black
                                              .make(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                10.heightBox
                              ],
                            );
                          }),
                    ),
                  ),
            50.heightBox
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.green,
            Colors.blue,
          ])),
    );
  }
}
