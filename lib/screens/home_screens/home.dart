import 'package:flutter/material.dart';
import 'package:pricex_solutions/functions/carteira.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pricex_solutions/main.dart';

double carteira = 1500.50;

int bitcoin = 0;
double ethereum = 0.0;
double tether = 0.0;

double saldoBtc = 0.0;
double saldoEth = 0.0;
double saldoUsdt = 0.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1a1b1d),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MinhaCarteira(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              alignment: Alignment.center,
              child: Text(
                'Informações em Tempo Real',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    height: 120.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'images/btc.png',
                            fit: BoxFit.scaleDown,
                            scale: 8.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: VerticalDivider(
                            color: Colors.grey[850],
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(bottom: 12.0)),
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
                                          color: Colors.orange[400],
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
                                        bitcoin =
                                            snapshot.data["bitcoin"]["usd"];

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 12.0,
                                            ),
                                            Text(
                                              'Bitcoin [BTC]',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              'Preço:',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              'US\$ $bitcoin',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                  }
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    height: 120.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'images/eth.png',
                            fit: BoxFit.scaleDown,
                            scale: 8.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: VerticalDivider(
                            color: Colors.grey[850],
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(bottom: 12.0)),
                            FutureBuilder<Map>(
                                future: fetchEth(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      return Align(
                                        alignment: Alignment.center,
                                        child: SpinKitThreeBounce(
                                          size: 18.0,
                                          color: Color(0xff617DEA),
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
                                        ethereum =
                                            snapshot.data["ethereum"]["usd"];

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 12.0,
                                            ),
                                            Text(
                                              'Ethereum [ETH]',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              'Preço:',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              'US\$ $ethereum',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                  }
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    height: 120.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'images/usdt.png',
                            fit: BoxFit.scaleDown,
                            scale: 8.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: VerticalDivider(
                            color: Colors.grey[850],
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(bottom: 12.0)),
                            FutureBuilder<Map>(
                                future: fetchUsdt(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      return Align(
                                        alignment: Alignment.center,
                                        child: SpinKitThreeBounce(
                                          size: 18.0,
                                          color: Color(0xff26a17b),
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
                                        tether = snapshot.data["tether"]["usd"];

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 12.0,
                                            ),
                                            Text(
                                              'Tether [USDT]',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              'Preço:',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              'US\$ $tether',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                  }
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              alignment: Alignment.center,
              child: Text(
                'Sua carteira em Criptomoedas',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 15.0),
                    child: Image.asset(
                      'images/btc.png',
                      fit: BoxFit.scaleDown,
                      scale: 8.0,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[850],
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.center,
                    child: FutureBuilder<Map>(
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
                              double doubleBtc = bitcoin.toDouble();

                              saldoBtc = (carteira / doubleBtc);

                              String saldoBtcString =
                                  saldoBtc.toStringAsFixed(5);

                              return Text(
                                "$saldoBtcString BTC",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 15.0),
                    child: Image.asset(
                      'images/eth.png',
                      fit: BoxFit.scaleDown,
                      scale: 8.0,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[850],
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.center,
                    child: FutureBuilder<Map>(
                      future: fetchEth(),
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
                              saldoEth = (carteira / ethereum);

                              String saldoEthString =
                                  saldoEth.toStringAsFixed(5);

                              return Text(
                                "$saldoEthString ETH",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 15.0),
                    child: Image.asset(
                      'images/usdt.png',
                      fit: BoxFit.scaleDown,
                      scale: 8.0,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[850],
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.center,
                    child: FutureBuilder<Map>(
                      future: fetchUsdt(),
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
                              saldoUsdt = (carteira / tether);

                              String saldoUsdtString =
                                  saldoUsdt.toStringAsFixed(1);

                              return Text(
                                "$saldoUsdtString USDT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
