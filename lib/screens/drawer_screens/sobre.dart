import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[900],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          'Sobre a PriceX Solutions',
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff1a1b1d),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40.0)),
            Image.asset(
              'images/PXSolutions.png',
              fit: BoxFit.scaleDown,
              scale: 8.0,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Quem somos PriceX uma gestora inteligente de ativos digitais!\n \nTrabalhamos com locação de ativos digitais.\n \nSomos especialistas em aproveitar a volatilidade do mercado cripto através de uma gestão bem estruturada conseguimos tirar proveito dessa oscilação e não dependemos apenas de um cenário positivo do mercado, pois nossas análises criteriosas nos permite operar a short (venda) dentro do mercado e assim garantirmos lucros nos fechamentos dos ciclos.',
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Text(
                'Sede:  AV GOV ARGEMIRO DE FIGUEIREDO, 2941 - Sala 304 - Jardim Oceania - João Pessoa - PB',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
