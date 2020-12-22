import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {

  final String route;

  const LabelsWidget({Key key, @required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text((this.route == 'register') ? '¿No tienes cuenta?' : '¿Ya tienes cuenta?',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.route);
            },
            child: Text((this.route == 'register') ? 'Crea una ahora!' : 'Inicia sesión!',
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}