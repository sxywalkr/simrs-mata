import 'package:flutter/material.dart';
import 'package:simrs_mata/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text('SIMRS MATA'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.mainPage),
            )
          ],
        ),
      ),
    );
  }
}
