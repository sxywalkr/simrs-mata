import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simrs_mata/models/app_user_model.dart';
import 'package:simrs_mata/routes/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appUserCollection = FirebaseFirestore.instance.collection('appUser');
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please add in your email';
                        } else if (!isValidEmail(value)) {
                          return 'Please add in a valid email';
                        } else {
                          return null;
                        }
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'You forgot your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least six characters';
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 65),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final _email = _emailController.text;
                            final _password = _passwordController.text;
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            )
                                .then(
                              (value) {
                                return _appUserCollection
                                    .where('appUserUid',
                                        isEqualTo: value.user.uid)
                                    .get()
                                    .then(
                                      (value) => _appUserCollection
                                          .doc(value.docs.first.id)
                                          .update({
                                        'appUserLastLogin':
                                            DateTime.now().toIso8601String()
                                      }).then((_) => Navigator.of(context)
                                                      .pushReplacementNamed(
                                                    Routes.mainPage,
                                                  )
                                              // Routes.splashPage,
                                              // arguments: value.docs.first.id),
                                              ),
                                    );
                              },
                            ).catchError((error) {
                              showErrorDialog(context, error);
                            });
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future showErrorDialog(BuildContext context, error) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Oh Snap!'),
          content: Text(error.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Dismiss'),
            )
          ],
        );
      },
    );
  }
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
