import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/first.dart';
import 'package:flutter_app/src/pages/home.dart';
import 'package:flutter_app/src/pages/second.dart';
import 'package:flutter_app/src/pages/user.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';




class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("firebase load failed"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Home();
        }
        return CircularProgressIndicator();
      },
    );
  }
}