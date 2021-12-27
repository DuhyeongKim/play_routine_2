import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/pages/first.dart';
import 'package:flutter_app/pages/second.dart';
import 'package:flutter_app/pages/user.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/", page: ()=> const Home()),
        GetPage(name: "/first", page: ()=> const FirstPage()),
        GetPage(name: "/second", page: ()=> const SecondPage()),
        GetPage(name: "/user/:uid", page: ()=> const UserPage()),
      ],
    );
  }
}
