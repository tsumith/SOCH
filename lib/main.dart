import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soch/ui/login/cover.dart';
import 'package:soch/ui/payments/payhome.dart';
import 'package:soch/ui/routes/home_page.dart';
import 'package:soch/ui/login/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'ui/login/signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnonKey!,
  );

  runApp(MyApp());
}

final SupabaseClient supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = Supabase.instance.client.auth.currentUser;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: user != null ? '/home' : '/',
      title: 'SOCH-anth-hi-arambh',
      routes: {
        '/': (context) => CoverPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/payhome': (context) => PayHome(),
      },
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
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
