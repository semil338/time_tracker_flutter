import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;
  const HomePage({Key key, @required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      try {
        await auth.signOut();
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          TextButton(
              onPressed: _signOut,
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ))
        ],
      ),
    );
  }
}
