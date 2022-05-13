import 'package:ticket_online/model/aluno.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';

class LoginController {
  
  AlunoRepository alunoRepository = AlunoRepository();

  Future<Aluno?> validarLogin(String ra, String senha) async {
    
    try {
      Aluno aluno = await alunoRepository.findByRA(ra);

      if(aluno.senha == senha){
        return aluno;
      }

    } catch (error) {
      print(error.toString());
    }

    return null;
  }
  
}
