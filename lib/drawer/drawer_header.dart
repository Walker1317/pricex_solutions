import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get_it/get_it.dart';
import 'package:pricex_solutions/screens/drawer_screens/sobre.dart';
import 'package:pricex_solutions/screens/login_screen.dart';
import 'package:pricex_solutions/stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        if (userManagerStore.isLoggedIn) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => InfoPage()));
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        height: 130,
        decoration: BoxDecoration(color: Colors.orange),
        child: Row(
          children: <Widget>[
            Icon(
              Ionicons.person_circle_outline,
              color: Colors.grey[900],
              size: 45,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    userManagerStore.isLoggedIn
                        ? "Olá, ${userManagerStore.user.apelido}!"
                        : 'Faça o Login',
                    style: TextStyle(color: Colors.grey[900], fontSize: 20.0),
                  ),
                  Text(
                    userManagerStore.isLoggedIn
                        ? "${userManagerStore.user.email}"
                        : 'Clique aqui',
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
