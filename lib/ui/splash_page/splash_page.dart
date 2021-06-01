import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/routes/routes.dart';
import 'package:simrs_mata/ui/login_page/login_page.dart';
import 'package:simrs_mata/ui/main_page/main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  startTimer() {
    var duration = Duration(milliseconds: 3000);
    return Timer(duration, redirect);
  }

  redirect() {
    // final userSignedIn = Provider.of<User>(context, listen: false) != null;
    // if (userSignedIn) {
    Navigator.of(context).pushReplacementNamed(Routes.mainPage);
    // } else {
    //   Navigator.of(context).pushReplacementNamed(Routes.loginPage);
    // }
  }
}
