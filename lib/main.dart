import 'package:flutter/material.dart';
import 'package:soch/ui/cover.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'ui/signIn.dart';
import 'services/project_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ProjectKeys key = ProjectKeys();

  await Supabase.initialize(
    url: key.url, // Replace with your Supabase URL
    anonKey: key.anonkey, // Replace with your Supabase anon key
  );
  runApp(const MyApp());
}

final SupabaseClient client = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'SOCH-anth-hi-arambh',
      routes: {
        '/': (context) => CoverPage(),
        '/signIn': (context) => SignInPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), // Global enabled border
          ),
          focusedBorder: OutlineInputBorder(
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
