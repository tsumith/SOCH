import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient supabase = Supabase.instance.client;
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await supabase!.auth
          .signUp(
        email: email,
        password: password,
      )
          .then((val) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Success'),
                  content: Text('you account has been created'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/signIn');
                      },
                      child: Text('OK'),
                    )
                  ],
                ));
      }).onError((err, val) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text(err.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    )
                  ],
                ));
      });
    } on AuthException catch (error) {
      print(error.message);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  String getEmail() {
    String? mail = supabase.auth.currentUser!.email;
    return mail ?? 'no user found';
  }

  Future<void> signIn(String email, String password) async {
    try {
      await supabase!.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (error) {
      print(error.message);
    } catch (error) {
      print(error.toString());
    }
  }
}
