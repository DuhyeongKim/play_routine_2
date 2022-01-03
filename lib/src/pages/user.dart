import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second Page"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${(Get.parameters['uid'])}"),
              Text("${(Get.parameters['name'])}"),
              Text("${(Get.parameters['age'])}"),
              TextButton(onPressed: (){
                Get.back();},
                  child: Text("뒤로 가기"))
            ],
          ),
        )
    );
  }
}
