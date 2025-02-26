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
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (session == null) {
              Navigator.pushReplacementNamed(context, '/');
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          });

          return const SizedBox.shrink(); // Avoid rebuilding unnecessary UI
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}