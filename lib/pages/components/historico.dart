import 'package:flutter/material.dart';

Expanded HistoricoList(BuildContext context, lista) {
  return Expanded(
    child: ListView.separated(
        itemBuilder: (BuildContext context, int id) => ListTile(
              leading: Text('${lista[0].historico[id].refeicao}'),
              trailing: Text('${lista[0].historico[id].data}'),
            ),
        padding: EdgeInsets.all(24),
        separatorBuilder: (_, __) => Divider(),
        itemCount: lista[0].historico.length),
  );
}
