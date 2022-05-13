import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_online/pages/home_page.dart';
import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  final _form1 = GlobalKey<FormState>();
  final _valor1 = TextEditingController();
  String login = '';
  String senha = '';
  LoginController loginController = LoginController();
  
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
                    onChanged: (value1) {
                      login = (value1.isEmpty) ? '' : (value1);
                    },
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
                      }
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
                    onChanged: (value) {
                      senha = (value.isEmpty) ? '' : (value);
                    },
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
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: MaterialButton(
                  onPressed: () {
                    try{
                      loginController.validarLogin(login, senha).then((aluno) => {
                          if(aluno != null){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Login realizado com sucesso'),
                            backgroundColor: Colors.green,
                            )),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return HomePage(aluno: aluno);
                          }))
                          }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Senha ou RA inválido"),
                                 backgroundColor: Colors.red,
                              ),
                            )
                          }
                      });
                    }catch (error) {
                      print(error.toString());
                    }
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
