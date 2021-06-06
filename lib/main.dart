import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracker",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SignInPage(),
    );
  }
}
