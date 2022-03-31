import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final lista = AlunoRepository.lista;

    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          Row(
            children: [
              Icon(Icons.account_circle),
            ],
          ),
          Row(
            children: [
              Text(lista[0].nome),
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),

      //body
    );
  }
}
