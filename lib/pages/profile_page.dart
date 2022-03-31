import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent[400],
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: '',
              onClicked: () async {},
            ),
          ],
        ));
  }
}
