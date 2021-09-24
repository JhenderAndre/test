import 'package:flutter/material.dart';

class OtraPagina extends StatefulWidget {
  const OtraPagina({Key? key}) : super(key: key);

  @override
  _OtraPaginaState createState() => _OtraPaginaState();
}

class _OtraPaginaState extends State<OtraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Otra pagina',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
