import 'package:flutter/material.dart';
import 'package:soch/services/auth_service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  String? mail;
  @override
  initState() {
    super.initState();
    mail = authService.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Home ${mail}")),
    );
  }
}
