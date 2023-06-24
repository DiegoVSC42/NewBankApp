import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'screens/cards.dart';
import 'screens/home.dart';
import 'screens/transations.dart';

class HomePage extends StatefulWidget {
  var firstName = "";
  var lastName = "";
  var balance = 0;
  var userToken = "";

  HomePage({
    required this.firstName,
    required this.lastName,
    required this.balance,
    required this.userToken,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const UserTransations(),
    UserHome(
      balance: 0,
      lastName: '',
      firstName: '',
      userToken: '',
    ),
    const UserCards(),
  ];

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userHomeWidget = UserHome(
      balance: widget.balance,
      lastName: widget.lastName,
      firstName: widget.firstName,
      userToken: widget.userToken,
    );

    _pages[1] = userHomeWidget;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        onTap: _navigateBottomNavBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pix),
            label: 'transaction'.i18n(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'.i18n(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'cards'.i18n(),
          ),
        ],
      ),
    );
  }
}
