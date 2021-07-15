import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pricex_solutions/screens/home_screens/home.dart';
import 'package:pricex_solutions/stores/user_manager_store.dart';

class MinhaCarteira extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 260,
      color: Colors.grey[900],
      child: Container(
        margin: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/pricexSymbolVec.png',
              fit: BoxFit.scaleDown,
              scale: 12.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Saldo Depositado:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "USD",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '$carteira',
                  style: TextStyle(fontSize: 56),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
