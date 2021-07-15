import 'package:flutter/material.dart';
import 'package:pricex_solutions/functions/carteira.dart';
import 'package:url_launcher/url_launcher.dart';

class Realocar extends StatefulWidget {
  const Realocar({Key key}) : super(key: key);

  @override
  _RealocarState createState() => _RealocarState();
}

enum SingingCharacter { bitcoin, ethereum, tether }

class _RealocarState extends State<Realocar> {
  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";

    await canLaunch(url) ? launch(url) : print("Falha ao abrir");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1a1b1d),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MinhaCarteira(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Solicitar Saldo",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Divider(
              height: 20.0,
              thickness: 2,
              color: Colors.grey[700],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: RaisedButton(
                color: Colors.greenAccent[700],
                onPressed: () {
                  launchWhatsapp(
                      number: "+5592996150981",
                      message:
                          "Olá, gostaria de fazer uma solicitação ,Nome: Digite seu nome ,Usuário: USER.ID ,Gostaria de solicitar: US\$ ");
                },
                child: Text("Solicitar através do Whatsapp"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
