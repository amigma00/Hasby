import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import '../List.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController createPost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.heightBox,
            "Create post".text.white.size(35).make(),
            20.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    TextField(
                      controller: createPost,
                      minLines: 10,
                      maxLines: 10,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your Thoughts..........',
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            ),
            10.heightBox,
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.teal,
                onPressed: () {
                  if (createPost.text =="")
                    Fluttertoast.showToast(
                        msg: "Please write something",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 17.0
                    );
                  else
                  accha.insert(0, createPost.text);
                  setState(() {
                    createPost.clear();
                  });
                  Fluttertoast.showToast(
                      msg: "The Post is created",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 17.0
                  );
                },
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.red,
            Colors.teal,
          ])),
    );
  }
}
