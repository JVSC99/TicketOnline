import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:ticket_online/repositories/carteira_repository.dart';
import 'package:ticket_online/repositories/historico_repository.dart';
import 'app_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlunoRepository()),
        ChangeNotifierProvider(create: (context) => CarteiraRepository()),
        ChangeNotifierProvider(create: (context) => HistoricoRepository())
      ],
      child: AppWidget(),
    ),
    );
}
