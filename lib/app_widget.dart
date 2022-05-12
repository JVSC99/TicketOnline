import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'package:ticket_online/database/db.dart';

class AppWidget extends StatelessWidget {
  DB db = DB.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
