import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIMRS MATA'),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Sign out'),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Center(
        child: Text('Have a nice day'),
      ),
    );
  }
}
