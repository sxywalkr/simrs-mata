import 'package:flutter/material.dart';
import 'package:simrs_mata/models/user_rm_data.dart';
import 'package:simrs_mata/ui/app_drawer/app_drawer.dart';

class ViwUserRmPage extends StatefulWidget {
  @override
  _ViwUserRmPageState createState() => _ViwUserRmPageState();
}

class _ViwUserRmPageState extends State<ViwUserRmPage> {
  UserRmData routes;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    routes = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View User RM'),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Material(
            elevation: 2,
            child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Card(
                  child: Text(routes.userRmNama),
                )),
          ),
        ),
      ),
    );
  }
}
