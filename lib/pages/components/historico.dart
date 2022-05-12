import 'package:flutter/material.dart';
import 'package:ticket_online/model/historico.dart';

Expanded HistoricoList(BuildContext context, lista) {
  return Expanded(
    child: Card(
      child: ListView.separated(
          reverse: true,
          itemBuilder: (BuildContext context, int id) => ListTile(
                leading: Text(lista[id].refeicao),
                trailing: Text(lista[id].data),
              ),
          padding: EdgeInsets.all(24),
          separatorBuilder: (_, __) => Divider(
                thickness: 1.2,
              ),
          itemCount: lista.length),
    ),
  );
}
