import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/controllers/login_controller.dart';
import 'package:ticket_online/pages/home_page.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class LoginPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  final _form1 = GlobalKey<FormState>();
  final _valor1 = TextEditingController();
  final lista = AlunoRepository.lista;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.food_bank,
                size: 120,
                color: Colors.deepOrange,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _form1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _valor1,
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'RA',
                      labelStyle:
                          TextStyle(color: Colors.deepOrange, fontSize: 20),
                    ),
                    style: TextStyle(color: Colors.deepOrange),
                    validator: (value1) {
                      if (value1!.isEmpty) {
                        return 'Inserir RA';
                      } else if (value1 != lista[0].ra) {
                        return 'Senha ou e-mail inválido';
                      }
                      value1 = '';
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _form,
                  child: TextFormField(
                    obscureText: true,
                    controller: _valor,
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Senha',
                      labelStyle:
                          TextStyle(color: Colors.deepOrange, fontSize: 20),
                    ),
                    style: TextStyle(color: Colors.deepOrange),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Inserir Senha';
                      } else if (value != lista[0].senha) {
                        return 'Senha ou e-mail inválido';
                      }
                      value = '';
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: MaterialButton(
                  onPressed: () {
                    LoginController(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: Colors.black, width: 1.5)),
                  textColor: Colors.white,
                  color: Colors.black87,
                  minWidth: 1000,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'ENTRAR',
                    textScaleFactor: 1.5,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
