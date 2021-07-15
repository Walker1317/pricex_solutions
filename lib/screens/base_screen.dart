import 'package:flutter/material.dart';
import 'package:pricex_solutions/drawer/custom_drawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pricex_solutions/screens/home_screens/home.dart';
import 'package:pricex_solutions/screens/home_screens/realocar.dart';
import 'package:pricex_solutions/screens/home_screens/rendimentos.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Image.asset(
          'images/pricexlogovec1.png',
          fit: BoxFit.scaleDown,
          scale: 4.0,
        ),
        centerTitle: true,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageViewController,
        children: <Widget>[
          Rendimentos(),
          HomeScreen(),
          Realocar(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return ConvexAppBar(
                backgroundColor: Colors.orange[400],
                color: Colors.grey[900],
                curveSize: 0.0,
                activeColor: Colors.grey[900],
                items: [
                  TabItem(icon: Icons.bar_chart, title: 'Rendimentos'),
                  TabItem(icon: Icons.home, title: 'Home'),
                  TabItem(
                      icon: Icons.monetization_on_rounded, title: 'Realocar'),
                ],
                initialActiveIndex: pageViewController?.page?.round() ??
                    0, //optional, default as 0
                onTap: (index) {
                  pageViewController.animateToPage(index,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                });
          }),
    );
  }
}
