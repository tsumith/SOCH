import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  SupabaseClient? supabase;
  bool loading = false;
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    supabase = Supabase.instance.client;
  }

  Future<void> _signIn() async {
    setState(() {
      loading = true;
    });
    try {
      await supabase!.auth
          .signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TestScreen(supabase!.auth.currentUser?.email),
            ));
      });
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error has occured.')),
      );
    }
  }

  Future<void> _signUp() async {
    try {
      await supabase!.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Sign up successful! Check your email to verify.')),
      );
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error has occured.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 20;
    // TODO: implement build
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset('assets/logo/Soch-logo-white.svg',
                          fit: BoxFit.contain),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Text("Create an account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Enter your email id to sign in"),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        await _signIn();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Continue")),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 1,
                          width: MediaQuery.of(context).size.width / 4,
                          color: Colors.grey,
                        ),
                        Text("or"),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width / 4,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    // decoration: BoxDecoration(color: Colors.blue),
                                    child: Image.asset(
                                        'assets/logo/google-logo.png',
                                        fit: BoxFit.cover)),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text('Sign-in with Google')
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(45, 129, 129, 129),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    // decoration: BoxDecoration(color: Colors.blue),
                                    child: Image.asset(
                                        'assets/logo/apple-logo.png',
                                        fit: BoxFit.cover)),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text('Sign-in with Apple'),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(45, 129, 129, 129),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class TestScreen extends StatelessWidget {
  final String? email;
  TestScreen(this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome $email"),
      ),
    );
  }
}
