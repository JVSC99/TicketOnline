import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/controller/pagar_controller.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class PagarPage extends StatefulWidget {
  Aluno aluno;
  PagarController pagarController = PagarController();
  AlunoRepository alunoRepository = AlunoRepository();

  PagarPage({Key? key, required this.aluno}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PagarPageState();
  }
}

class PagarPageState extends State<PagarPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  readQRcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    if (code == '10') {
      setState(() {
        if (widget.aluno.carteira.saldo > 0) {
          widget.pagarController.pagarRefeicao(widget.aluno).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Pagamento realizado com sucesso'),
              backgroundColor: Colors.green,
            ))
          });
          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Saldo insuficiente'),
            backgroundColor: Colors.red,
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Saldo(context, widget.aluno.carteira.saldo),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: readQRcode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('PAGAR'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                '3.50 BRL (por refeição)',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
