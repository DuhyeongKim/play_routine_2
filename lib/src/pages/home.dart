import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/second.dart';
import 'package:flutter_app/src/pages/simple_state_manage.dart';
import 'package:get/get.dart';
import 'package:flutter_app/src/pages/syncfusion.dart';
import 'first.dart';
import 'package:flutter_app/src/pages/progressbar.dart';

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
            TextButton(onPressed: (){
              Get.to(SyncFusion());
            }
              , child: Text("Syncfusion"),),
            TextButton(onPressed: (){
              Get.to(ProgressBar());
            }
              , child: Text("progress bar"),),

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