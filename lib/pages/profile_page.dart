import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_online/pages/components/historico.dart';
import 'login_page.dart';
import 'components/app_bar.dart';
import 'components/profile_widget.dart';
import 'components/saldo.dart';
import '../repositories/aluno_repository.dart';
import '../../model/aluno.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  final alunos = AlunoRepository.lista;
  final rightAppBaricon = Icons.notifications_none;
  final leading = BackButton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[400],
      appBar: buildAppBar(context, leading, rightAppBaricon),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: alunos[0].imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            buildName(alunos[0]),
            buildRA(alunos[0]),
            Saldo(context, alunos[0].carteira.saldo),
            SingleChildScrollView(
                child: SizedBox(
                    height: 200, child: HistoricoList(context, alunos))),
            buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget buildName(Aluno aluno) => Column(
        children: [
          Text(
            aluno.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      );

  Widget buildRA(Aluno aluno) => Column(
        children: [
          Text(
            "RA: " + aluno.ra,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.white,
            ),
          )
        ],
      );

  Widget buildLogoutButton() => Padding(
        padding: const EdgeInsets.all(32.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Colors.black, width: 1.5)),
          textColor: Colors.white,
          color: Colors.black87,
          minWidth: 1000,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'SAIR',
            textScaleFactor: 1.5,
          ),
        ),
      );
}
