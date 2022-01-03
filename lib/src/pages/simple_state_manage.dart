import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleState extends StatelessWidget {
  const SimpleState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("단순상태관리"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              TextButton(onPressed: (){
                Get.back();},
                  child: Text("+", style: TextStyle(fontSize: 30),)),
              TextButton(onPressed: (){
                Get.back();},
                  child: Text("뒤로 가기"))
            ],
          ),
        )
    );
  }
}
