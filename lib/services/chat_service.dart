import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    try {
      final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });

      final mensajesResp = mensajesResponseFromJson(resp.body);

      return mensajesResp.mensajes;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
