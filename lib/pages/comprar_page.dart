import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:pay/pay.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:http/http.dart' as http;

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
  int qtd = 1;
  String resultado = 'Total';
  var id;
  var cor;

  BuscarId() async {
    String uri =
        'https://api.mercadopago.com/checkout/preferences?access_token=TEST-4453779879566105-041022-7c4448f2d15aa1b16d98ab85663d936e-316925024';
    var response = await http.post(Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'items': [
            {
              "title": "Refeição RU",
              "description": "Refeição RU",
              "quantity": 1,
              "currency_id": "/BRL",
              "unit_price": 3.50
            }
          ],
          "payer": {"email": "payer@email.com"}
        }));

    print(response.statusCode);
    final json = jsonDecode(response.body)['id'];
    print(json);
    id = json.toString();
    PaymentResult result = await MercadoPagoMobileCheckout.startCheckout(
      "TEST-cab429de-82f7-49a2-8309-6c6b7b5aea5e",
      id,
    );
    print(result.toString());
    setState(() {
      resultado = result.status.toString();
      if (resultado == 'null') {
        resultado = 'cancelada';
        cor = Colors.red;
      } else if (resultado == 'approved') {
        AlunoRepository.lista[0].carteira.saldo += qtd;
        resultado = 'aprovada';
        cor = Colors.green;
      } else {
        cor = Colors.red;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Transação ${resultado}"),
        backgroundColor: cor,
      ));
    });
  }

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
            Saldo(context, alunos[0].carteira.saldo),
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
                  BuscarId();
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
