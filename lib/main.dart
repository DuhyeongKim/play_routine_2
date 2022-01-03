import 'package:flutter/material.dart';
import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/pages/home.dart';
import 'package:flutter_app/src/pages/first.dart';
import 'package:flutter_app/src/pages/second.dart';
import 'package:flutter_app/src/pages/user.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    configOneSignel();
  }

  void configOneSignel()
  {
    OneSignal.shared.setAppId('8537ab13-064e-4394-8332-d18ef4e3cf5e');
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/", page: ()=> const App()),
        GetPage(name: "/home", page: ()=> const Home()),
        GetPage(name: "/first", page: ()=> const FirstPage()),
        GetPage(name: "/second", page: ()=> const SecondPage()),
        GetPage(name: "/user/:uid", page: ()=> const UserPage()),
      ],
    );
  }
}
