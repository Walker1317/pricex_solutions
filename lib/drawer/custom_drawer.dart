import 'package:flutter/material.dart';
import 'package:pricex_solutions/drawer/drawer_header.dart';
import 'package:pricex_solutions/drawer/page_section.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(color: Colors.grey[900]),
        );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: PageSection(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
