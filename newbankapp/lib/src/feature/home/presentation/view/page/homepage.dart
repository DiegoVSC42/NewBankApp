import 'package:flutter/material.dart';
import '../../../../../component/newbank_text.dart';
import '../widget/cards.dart';
import '../widget/home.dart';
import '../widget/transations.dart';

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

    Future jwtFunc(
        String firstName, String lastName, int balance, String userToken) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const NewBankText(
              'JWT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            content: Text(
              userToken,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const NewBankText(
                  'OK',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    _pages[1] = userHomeWidget;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: Colors.indigo,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        onTap: _navigateBottomNavBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pix), label: 'Transações'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Cartões'),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.indigo,
      //     onPressed: () {
      //       jwtFunc(widget.firstName, widget.lastName, widget.balance,
      //           widget.userToken);
      //       print("JWT" + widget.userToken);
      //     }),
    );
  }
}
