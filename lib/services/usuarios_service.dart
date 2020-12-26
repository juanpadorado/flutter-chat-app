import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/usuario.dart';

class UsuariosService {

  Future<List<Usuario>> getUsuarios() async {
    try {
       final resp = await http.get('${Environment.apiUrl}/usuarios',
       headers: {
         'Content-Type': 'application/json',
         'x-token': await AuthService.getToken()
       });

       final usuariosReponse = usuariosResponseFromJson(resp.body);

       return usuariosReponse.usuarios;
    } catch (e) {
      print(e);
      return [];
    }
  }

}