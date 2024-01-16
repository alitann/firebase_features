import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);

    // return StreamBuilder<AppUser?>(
    //   stream: AuthService().appUser,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData && snapshot.data != null) {
    //       return const Home();
    //     } else {
    //       return const Authenticate();
    //     }
    //   },
    // );

    if (appUser == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
