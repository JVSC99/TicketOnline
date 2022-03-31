import 'package:flutter/material.dart';

Container Saldo(BuildContext context, double saldo) {
  double saldo_conta = saldo;
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
                'Seu saldo',
                textScaleFactor: 1,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
