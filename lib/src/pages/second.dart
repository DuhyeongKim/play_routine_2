import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${(Get.arguments as User).name} "),
            Lottie.asset('assets/lottie/fire.json'),
            TextButton(onPressed: (){
              Get.back();},
                child: Text("뒤로 가기")),

          ],
        ),
      )
    );
  }
}

