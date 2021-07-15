import 'package:flutter/material.dart';
import 'package:pricex_solutions/functions/carteira.dart';
import 'package:pricex_solutions/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pricex_solutions/screens/home_screens/home.dart';

double rendimentoMes = 0.0;
double rendimentoDia = 0.0;

double porcentagemMes = 5;
double porcentagemDia = 0.16;

class Rendimentos extends StatefulWidget {
  const Rendimentos({Key key}) : super(key: key);

  @override
  _RendimentosState createState() => _RendimentosState();
}

class _RendimentosState extends State<Rendimentos> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff1a1b1d),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MinhaCarteira(),
              Container(
                height: 26,
                alignment: Alignment.center,
                child: Text(
                  'Rendimento Mensal',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 160.0,
                width: 999,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 20.0, top: 0.0, bottom: 10.0),
                          child: Text(
                            "Rendimento/mês",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "USD\n \n",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FutureBuilder<Map>(
                                  future: fetchBtc(),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Align(
                                          alignment: Alignment.center,
                                          child: SpinKitThreeBounce(
                                            size: 18.0,
                                            color: Colors.white,
                                          ),
                                        );
                                      default:
                                        if (snapshot.hasError) {
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Erro ao carregar',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey[800])),
                                          );
                                        } else {
                                          rendimentoMes =
                                              (carteira * porcentagemMes / 100);

                                          String rendimentoMesTotal =
                                              (rendimentoMes + carteira)
                                                  .toStringAsFixed(2);

                                          String rendimentoMesString =
                                              rendimentoMes.toStringAsFixed(2);

                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "$rendimentoMesTotal",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 42.0),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.add,
                                                    size: 14.0,
                                                    color:
                                                        Colors.greenAccent[400],
                                                  ),
                                                  Text(
                                                    "\$$rendimentoMesString",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .greenAccent[400],
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //porcentagem mês
                  ],
                ),
              ),
              Container(
                height: 26,
                alignment: Alignment.center,
                child: Text(
                  'Rendimento diário',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                height: 160.0,
                width: 999,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 20.0, top: 0.0, bottom: 10.0),
                          child: Text(
                            "Rendimento/dia",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "USD\n \n",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FutureBuilder<Map>(
                                  future: fetchBtc(),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Align(
                                          alignment: Alignment.center,
                                          child: SpinKitThreeBounce(
                                            size: 18.0,
                                            color: Colors.white,
                                          ),
                                        );
                                      default:
                                        if (snapshot.hasError) {
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text('Erro ao carregar',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey[800])),
                                          );
                                        } else {
                                          rendimentoDia =
                                              (carteira * porcentagemDia / 100);
                                          String rendimentoDiaString =
                                              rendimentoDia.toStringAsFixed(2);

                                          return Text(
                                            "$rendimentoDiaString",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 42.0),
                                          );
                                        }
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //porcentagem mês
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
