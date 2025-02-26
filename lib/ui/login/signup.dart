import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soch/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  double spacing = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                    Text("Enter your email id to sign up"),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "email", border: OutlineInputBorder()),
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
                            hintText: "password", border: OutlineInputBorder()),
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
                        await authService.signUp(_emailController.text,
                            _passwordController.text, context);
                        setState(() {
                          loading = false;
                        });
                       
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("sign up")),
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
