import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void launchHelp() async {
      String url = "https://www.menthorytrader.com/";

      await canLaunch(url) ? launch(url) : print("Falha ao abrir");
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[400],
        accentColor: Colors.orange[400],
      ),
      home: Scaffold(
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
            'Precisa de Ajuda?',
            style: TextStyle(color: Colors.grey[900]),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[400],
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Color(0xff1a1b1d),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Visite nosso site",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Divider(
                height: 20.0,
                thickness: 2,
                color: Colors.grey[700],
              ),
              SizedBox(
                child: RaisedButton(
                  color: Colors.orange[400],
                  onPressed: () {
                    launchHelp();
                  },
                  child: Text(
                    "Acesse nosso site para mais informações",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
