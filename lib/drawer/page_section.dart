import 'package:flutter/material.dart';
import 'package:pricex_solutions/drawer/page_tile.dart';
import 'package:pricex_solutions/screens/drawer_screens/help.dart';
import 'package:pricex_solutions/screens/drawer_screens/sobre.dart';

class PageSection extends StatefulWidget {
  @override
  _PageSectionState createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {
            Navigator.of(context).pop();
          },
          highlighted: false,
        ),
        PageTile(
          label: 'Sobre a PriceX Solutions',
          iconData: Icons.security,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => InfoPage()));
          },
          highlighted: false,
        ),
        PageTile(
          label: 'Ajuda',
          iconData: Icons.help,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Help()));
          },
          highlighted: false,
        ),
        PageTile(
          label: 'Sair',
          iconData: Icons.exit_to_app,
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
