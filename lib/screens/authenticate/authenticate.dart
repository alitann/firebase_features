import 'package:firebase/screens/authenticate/register.dart';
import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSingIn = true;

  void toogle() {
    setState(() {
      showSingIn = !showSingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSingIn ? SignIn(toogle: toogle) : Register(toogle: toogle);
  }
}
