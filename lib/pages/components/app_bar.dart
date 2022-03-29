import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = Icons.notifications_none;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: () {}, icon: Icon(icon)),
    ],
  );
}
