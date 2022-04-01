import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class ComprarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ComprarPageState();
  }
}

class ComprarPageState extends State<ComprarPage> {
  final alunos = AlunoRepository.lista;
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  int qtd = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Saldo(context, alunos[0].carteira.saldo),
            Form(
              key: _form,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    qtd = (value.isEmpty) ? 0 : int.parse(value);
                  });
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantidade',
                  suffix: Text('Tickets '),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inserir quantidade';
                  } else if (int.parse(value) < 1) {
                    return 'Inserir Quantidade Mínima (1)';
                  }
                  value = '';
                  return null;
                },
              ),
            ),
            (qtd > 0)
                ? Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      '$qtd tickets são ${qtd * 3.5} BRL',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Container(),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    setState(() {
                      AlunoRepository.lista[0].carteira.saldo += qtd;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Compra realizada com sucesso')));
                      qtd = 0;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('COMPRAR'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
