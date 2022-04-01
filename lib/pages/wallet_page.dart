import 'package:flutter/material.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalletPageState();
  }
}

class WalletPageState extends State<WalletPage> {
  final lista = AlunoRepository.lista;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Saldo(context, lista[0].carteira.saldo),
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
            Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int id) => ListTile(
                          leading: Text('${lista[0].historico[id].refeicao}'),
                          trailing: Text('${lista[0].historico[id].data}'),
                        ),
                    padding: EdgeInsets.all(24),
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: lista[0].historico.length))
          ],
        ),
      ),
    );
  }
}
