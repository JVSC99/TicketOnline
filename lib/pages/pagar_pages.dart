import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/model/historico.dart';
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
  final date = DateTime.now();
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  int qtd = 1;

  readQRcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    if (code == '10') {
      setState(() {
        if (AlunoRepository.lista[0].carteira.saldo > 0) {
          AlunoRepository.lista[0].carteira.saldo -= qtd;
          AlunoRepository.lista[0].historico.add(
            Historico(
                data:
                    '${date.day}/${date.month}/${date.year} ${date.hour - 3}:${date.minute}',
                refeicao: (date.hour - 3 < 14) ? 'Almoço ' : 'Jantar '),
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Pagamento realizado com sucesso'),
            backgroundColor: Colors.green,
          ));
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
            Saldo(context, alunos[0].carteira.saldo),
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
