import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simrs_mata/routes/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String _appUserUid = 'No Data';

  @override
  void initState() {
    super.initState();
    // if (mounted) startTimer();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _appUserUid = ModalRoute.of(context).settings.arguments;
    _cekRole(_appUserUid);
  }

  void _cekRole(String cekA) {
    FirebaseFirestore.instance
        .collection('appUser')
        .where('appUserUid', isEqualTo: cekA)
        .get()
        .then((value) {
      print('2, $cekA');
      print(value.docs.first.data()['appUserRole']);
      if (value.docs.first.data()['appUserRole'] == 'Guest') {
        Navigator.of(context).pushReplacementNamed(Routes.mainPage);
      } else if (value.docs.first.data()['appUserRole'] == 'Resepsionis') {
        Navigator.of(context).pushReplacementNamed(Routes.mainPage);
      } else if (value.docs.first.data()['appUserRole'] == 'Nurse') {
        Navigator.of(context).pushReplacementNamed(Routes.mainPage);
      } else if (value.docs.first.data()['appUserRole'] == 'Dokter') {
        Navigator.of(context).pushReplacementNamed(Routes.mainPage);
      } else if (value.docs.first.data()['appUserRole'] == 'App Admin') {
        Navigator.of(context).pushReplacementNamed(Routes.mainPage);
      }
    });
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

  redirect() async {
    try {
      print('1, $_appUserUid');
      if (
          // _appUserUid != 'No Data' ||
          //   _appUserUid.length > 0 ||
          _appUserUid != null) {
        await FirebaseFirestore.instance
            .collection('appUser')
            .where('appUserUid', isEqualTo: _appUserUid)
            .get()
            .then((value) {
          print('2, $_appUserUid');
          print(value.docs.first.data()['appUserRole']);
          if (value.docs.first.data()['appUserRole'] == 'Guest') {
            Navigator.of(context).pushReplacementNamed(Routes.mainPage);
          } else if (value.docs.first.data()['appUserRole'] == 'Resepsionis') {
            Navigator.of(context).pushReplacementNamed(Routes.mainPage);
          } else if (value.docs.first.data()['appUserRole'] == 'Nurse') {
            Navigator.of(context).pushReplacementNamed(Routes.mainPage);
          } else if (value.docs.first.data()['appUserRole'] == 'Dokter') {
            Navigator.of(context).pushReplacementNamed(Routes.mainPage);
          } else if (value.docs.first.data()['appUserRole'] == 'App Admin') {
            Navigator.of(context).pushReplacementNamed(Routes.mainPage);
          }
        });
      } else {
        print('3, $_appUserUid');
        Navigator.of(context).pushReplacementNamed(Routes.loginPage);
      }
    } catch (e) {
      print('4, $_appUserUid');
      print(e);
      Navigator.of(context).pushReplacementNamed(Routes.loginPage);
    }
  }
}
