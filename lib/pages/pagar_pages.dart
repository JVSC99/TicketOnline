import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class PagarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PagarPageState();
  }
}

class PagarPageState extends State<PagarPage> {
  final alunos = AlunoRepository.lista;
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  int qtd = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Saldo(context, alunos[0].carteira.saldo),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    AlunoRepository.lista[0].carteira.saldo -= qtd;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('COMPRAR'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                '${3.50} BRL (por refeição)',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
