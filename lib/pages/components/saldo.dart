import 'package:flutter/material.dart';

Container Saldo(BuildContext context, int saldo) {
  int saldo_conta = saldo;
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                '${saldo_conta}',
                textScaleFactor: 5,
              ),
              Text(
                'Seus Tickets',
                textScaleFactor: 1,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
