import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:pay/pay.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_online/controller/comprar_controller.dart';

class ComprarPage extends StatefulWidget {

  Aluno aluno;

  AlunoRepository alunoRepository = AlunoRepository();

  ComprarController comprarController = ComprarController();

  ComprarPage({Key? key, required this.aluno}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ComprarPageState();
  }
}

class ComprarPageState extends State<ComprarPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  String resultado = 'Total';
  var id;
  var cor;

  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '0,01',
      status: PaymentItemStatus.final_price,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Saldo(context, widget.aluno.carteira.saldo),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'O ticket é 3.50 BRL',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  widget.comprarController.buscarId().then((result) => {
                      setState(() {
                      resultado = result.status.toString();

                      if (resultado == 'null') {
                        resultado = 'cancelada';
                        cor = Colors.red;
                      } else if (resultado == 'approved') {
                        widget.aluno.carteira.saldo += 1;
                        
                        widget.alunoRepository.save(widget.aluno);
                        
                        resultado = 'aprovada';
                        cor = Colors.green;
                      } else {
                        cor = Colors.red;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Transação ${resultado}"),
                        backgroundColor: cor,
                      ));
                    })
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Comprar Ticket',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
