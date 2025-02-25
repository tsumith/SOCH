import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient supabase = Supabase.instance.client;
  Future<void> signUp(String email, String password) async {
    try {
      await supabase!.auth.signUp(
        email: email,
        password: password,
      );
    } on AuthException catch (error) {
      print(error.message);
    } catch (err) {
      print(err.toString());
    }
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
