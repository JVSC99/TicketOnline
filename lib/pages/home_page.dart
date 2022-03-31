import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/pages/components/comprar_ticket.dart';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/pages/components/wallet.dart';
import 'package:ticket_online/pages/profile_page.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final lista = AlunoRepository.lista;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 20,
            backgroundColor: Colors.orange,
            title: Text(lista[0].nome),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  icon: Icon(Icons.account_circle_outlined))
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  text: 'Wallet',
                ),
                Tab(
                  icon: Icon(Icons.attach_money),
                  text: 'Pagar',
                ),
                Tab(
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  text: 'Comprar Ticket',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPage(lista[0].carteira.saldo, 'Wallet'),
              buildPage(lista[0].carteira.saldo, 'Pagar'),
              buildPage(lista[0].carteira.saldo, 'Comprar'),
            ],
          )),
    );
  }

  Widget buildPage(double saldo, String text) {
    if (text == 'Wallet') {
      return Wallet(context, saldo);
    }
    if (text == 'Pagar') {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Saldo(context, saldo),
          ],
        ),
      );
    }
    if (text == 'Comprar') {
      return Comprar(context, saldo);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [Saldo(context, saldo)],
      ),
    );
  }
}
