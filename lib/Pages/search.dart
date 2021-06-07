import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../List.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.heightBox,
            "Search".text.white.size(35).make(),
            20.heightBox,
            ClipRRect(
              child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                child: Container(
                    padding: EdgeInsets.only(left: 10),
                    color: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Search Keyword".text.gray500.make(),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ),
                      ],
                    )
                    // TextField(
                    //   controller: search,
                    //   style: TextStyle(color: Colors.black),
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       suffixIcon: IconButton(
                    //         icon: Icon(
                    //           Icons.search,
                    //           color: Colors.black,
                    //         ),
                    //         onPressed: () {
                    //           showSearch(
                    //               context: context, delegate: DataSearch());
                    //         },
                    //       ),
                    //       hintText: 'Search keyword',
                    //       hintStyle: TextStyle(color: Colors.black38)),
                    // ),
                    ),
              ),
              //color: Colors.white,
              //height: 50,

              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.yellow,
            Colors.orange,
          ])),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList =
        query.isEmpty ? recent : accha.where((p) => p.contains(query)).toList();
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: suggestionList.length,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.asset(
                              "res/accha.jpg",
                              scale: 60,
                              // height: 50,
                              // width: 50,
                            ),
                          ),
                          5.widthBox,
                          "Anonymous".text.size(20).black.make()
                        ],
                      ),
                      10.heightBox,
                      Container(
                          // height: 100,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black)),
                          child: RichText(
                            text: TextSpan(
                                text: suggestionList[index]
                                    .substring(0, query.length),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  //fontWeight: FontWeight.bold
                                ),
                                children: [
                                  TextSpan(
                                      text: suggestionList[index]
                                          .substring(query.length),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        //fontWeight: FontWeight.bold
                                      )),
                                ]),
                          ))
                    ],
                  ),
                ),
              ),
              10.heightBox
            ],
          );
        });
  }

  final recent = [];
}
