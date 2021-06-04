import 'package:flutter/material.dart';
import 'package:simrs_mata/models/user_rm_data.dart';
import 'package:simrs_mata/routes/routes.dart';
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('View User RM'),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: SizedBox(
          width: width * 0.6,
          child: Material(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Data Pasien',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Nama :'),
                      SizedBox(width: 8),
                      Text(routes.userRmNama),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('NIK :'),
                      SizedBox(width: 8),
                      Text(routes.userRmNik),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Nomor RM :'),
                      SizedBox(width: 8),
                      Text(routes.userRmNomorRm),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.creDataUserRm);
                      },
                      child: Text('Tambah Data Rekam Medik'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
