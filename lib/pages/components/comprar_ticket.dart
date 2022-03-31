import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

Container Comprar(BuildContext context, double saldo) {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double qtd = 0;

  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Saldo(context, saldo),
          Text('${qtd * 3.5}'),
          Form(
            key: _form,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _valor,
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  suffix: Text('BRL ')),
            ),
          )
        ],
      ),
    ),
  );
}
