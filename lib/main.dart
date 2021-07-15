import 'package:flutter/material.dart';
import 'package:pricex_solutions/screens/base_screen.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pricex_solutions/screens/login_screen.dart';
import 'package:pricex_solutions/stores/page_store.dart';
import 'package:pricex_solutions/stores/user_manager_store.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> fetchBtc() async {
  var url =
      "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd";
  var response = await http.get(Uri.parse(url));
  print(response.body);
  var json = jsonDecode(response.body);
  return json;
}

Future<Map> fetchEth() async {
  var url =
      "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd";
  var response = await http.get(Uri.parse(url));
  print(response.body);
  var json = jsonDecode(response.body);
  return json;
}

Future<Map> fetchUsdt() async {
  var url =
      "https://api.coingecko.com/api/v3/simple/price?ids=tether&vs_currencies=usd";
  var response = await http.get(Uri.parse(url));
  print(response.body);
  var json = jsonDecode(response.body);
  return json;
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
  setupLocators();
  runApp(MyApp());

  await Parse().initialize(
    'ySOi34f0SRibJhOCeDA0So7iJRvGX8ZgvJQVnh7U',
    'https://parseapi.back4app.com/',
    clientKey: 'r6TalSUzxLZKwPCYIo6iffCUSWDjGVssyZ6mS4Jt',
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BaseScreen(),
    );
  }
}
