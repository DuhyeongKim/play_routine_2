import 'package:flutter/material.dart';
import 'package:flutter_app/pages/second.dart';
import 'package:flutter_app/pages/simple_state_manage.dart';
import 'package:get/get.dart';

import 'pages/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Getx Pactice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: (){
              Get.to(FirstPage(),transition: Transition.zoom);
              }
              , child: Text("First Page"), ),
            TextButton(onPressed: (){
              Get.toNamed("/second",arguments:
              User(name: "YOMI"));
            }
              , child: Text("Second Page(User)"), ),
            TextButton(onPressed: (){
              Get.toNamed("/user/23432?name=플레이루틴&age=21");
            }
              , child: Text("동적 URL"), ),
            TextButton(onPressed: (){
              Get.to(SimpleState());
            }
              , child: Text("단순상태관리"),),

          ],
        ),
      ),
    );
  }
}


class User{
  String name;
  User({required this.name});
}