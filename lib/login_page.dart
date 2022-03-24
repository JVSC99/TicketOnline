import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_online/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.food_bank,
                size: 120,
                color: Colors.white54,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'RA',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  cursorColor: Colors.white,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'SENHA',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: Colors.black, width: 1.5)),
                  textColor: Colors.orangeAccent[400],
                  color: Colors.black87,
                  minWidth: 1000,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'ENTRAR',
                    textScaleFactor: 1.5,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
