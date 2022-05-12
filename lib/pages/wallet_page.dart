import 'package:flutter/material.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:ticket_online/model/aluno.dart';

import 'components/historico.dart';

class WalletPage extends StatefulWidget {

  Aluno aluno;

  WalletPage({Key? key, required this.aluno}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WalletPageState();
  }
}

class WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Saldo(context, widget.aluno.carteira.saldo),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Histórico',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            HistoricoList(context, widget.aluno.historico)
          ],
        ),
      ),
    );
  }
}
