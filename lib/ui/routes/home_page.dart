import 'package:flutter/material.dart';
import 'package:soch/services/auth_service.dart';
import 'package:soch/ui/components/navbar.dart';
import 'package:soch/ui/routes/home.dart';
import 'package:soch/ui/routes/profile.dart';
import 'package:soch/ui/routes/settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  String mail = "nothing";
  List<Widget> pages = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();

    pages = [Home(), Settings(), Profile()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text('Welcome to SOCH'), actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            authService.signOut();
            Navigator.pushNamed(context, '/');
          },
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: const Color.fromARGB(255, 165, 149, 6),
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      body: pages[_index],
    );
  }
}
