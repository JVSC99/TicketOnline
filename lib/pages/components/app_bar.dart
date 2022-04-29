import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, leading, rightIcon) {
  return AppBar(
    leading: leading,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: () {}, icon: Icon(rightIcon)),
    ],
  );
}
