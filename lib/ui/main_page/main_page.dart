import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simrs_mata/routes/routes.dart';
import 'package:simrs_mata/ui/app_drawer/app_drawer.dart';
import 'package:simrs_mata/ui/rekam_medik_page/rekam_medik_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('SIMRS MATA'),
        elevation: 0,
        // backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Sign out'),
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.loginPage);
              return FirebaseAuth.instance.signOut();
            },
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Text('Have a nice day'),
          RekamMedikPage(),
        ],
      ),
    );
  }
}
