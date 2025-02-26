import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soch/services/auth_check.dart';
import 'package:soch/ui/login/cover.dart';
import 'package:soch/ui/routes/home_page.dart';
import 'package:soch/ui/login/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'ui/login/signIn.dart';
import 'services/project_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnonKey!,
  );
  runApp(const MyApp());
}

final SupabaseClient supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/auth-check',
      title: 'SOCH-anth-hi-arambh',
      routes: {
        '/': (context) => CoverPage(),
        '/auth-check': (context) => AuthCheck(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Global enabled border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: const Color.fromARGB(
                    255, 216, 191, 1)), // Global focused border
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Global error border
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
