import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soch/services/auth_service.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 17;
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset('assets/logo/Soch-logo-white.svg',
                          fit: BoxFit.contain),
                    ),
                    Text("Have an account?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Then let's just sign in!"),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "email"),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "password"),
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
                        await authService
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((val) {
                          Navigator.pushNamed(context, '/home').then((val) {
                            setState(() {
                              loading = false;
                            });
                          });

                          // ignore: use_build_context_synchronously
                        });
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
                      child: Center(
                          child: Text(
                        "don't have an account? then let's",
                        style: TextStyle(fontSize: 12),
                      )),
                      height: spacing + 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          "sign up",
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 3, 3, 3),
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
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/logo/google-logo.png',
                                    fit: BoxFit.cover),
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
