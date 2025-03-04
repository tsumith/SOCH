import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soch/services/auth_service.dart';
import 'package:soch/ui/components/backgraphic.dart';
import 'package:soch/ui/components/buttons.dart';

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
          : Stack(children: [
              CoverGraphics(),
              Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          child: SvgPicture.asset(
                              'assets/logo/Soch-logo-white.svg',
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
                                border: OutlineInputBorder(),
                                hintText: "email"),
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
                                border: OutlineInputBorder(),
                                hintText: "password"),
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
                                .signIn(_emailController.text,
                                    _passwordController.text)
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Button1(
                                      url: 'assets/logo/google-logo.png',
                                      onTap: () {})),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Button1(
                                  url: 'assets/logo/apple-logo.png',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: spacing,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
    );
  }
}
