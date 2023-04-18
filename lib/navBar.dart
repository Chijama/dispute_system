import 'package:dispute_system/main.dart';
import 'package:flutter/material.dart';
import 'demerit/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'theme.dart';
import 'package:dispute_system/dispute.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = <Widget>[
    const HomePage(),
    DisputeWidget(),
    Container(),
  ];

  void onTabTapped(final int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: SafeArea(child: _children[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          unselectedItemColor: const Color(0xff515B6F),
          selectedItemColor: themes().primaryColor,
          selectedLabelStyle: TextStyles().defaultText(
            14,
            FontWeight.w400,
            themes().primaryColor,
          ),
          unselectedLabelStyle: TextStyles().defaultText(
            14,
            FontWeight.w400,
            const Color(0xff515B6F),
          ),
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.home),
              ),
              label: 'Homepage',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(FontAwesomeIcons.gavel),
              ),
              label: 'Dispute',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.person),
              ),
              label: 'Account',
            ),
          ],
        ),
      );
}
