import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCheck extends StatelessWidget {
  final SupabaseClient supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final session = snapshot.data?.session;
          if (session == null) {
            // User is not logged in, navigate to login
            Navigator.pushReplacementNamed(context, '/');
          } else {
            // User is logged in, navigate to home
            Navigator.pushReplacementNamed(context, '/home');
          }
          return const SizedBox
              .shrink(); // return an empty widget, navigation has happened.
        } else {
          // Show a loading indicator while checking
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
