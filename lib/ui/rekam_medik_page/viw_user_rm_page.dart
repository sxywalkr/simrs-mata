import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simrs_mata/models/data_user_rm_model.dart';
import 'package:simrs_mata/models/user_rm_model.dart';
import 'package:simrs_mata/routes/routes.dart';
import 'package:simrs_mata/ui/app_drawer/app_drawer.dart';
import 'package:simrs_mata/ui/widget/empty_content_widget.dart';

class ViwUserRmPage extends StatefulWidget {
  @override
  _ViwUserRmPageState createState() => _ViwUserRmPageState();
}

class _ViwUserRmPageState extends State<ViwUserRmPage> {
  UserRmModel _userRmModel;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _userRmModel = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    // final _docs = Provider.of<List<DataUserRmModel>>(context);

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
                      Text(_userRmModel.userRmNama),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('NIK :'),
                      SizedBox(width: 8),
                      Text(_userRmModel.userRmNik),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Nomor RM :'),
                      SizedBox(width: 8),
                      Text(_userRmModel.userRmNomorRm),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Divider(),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.creDataUserRm,
                            arguments: _userRmModel);
                      },
                      child: Text('Tambah Data Rekam Medik'),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                      width: width * 0.6,
                      height: 400,
                      child: _buildBodySection(context)),
                  // Column(
                  //   children: [
                  //     _buildBodySection(context),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final dataUserRmStream = FirebaseFirestore.instance
        .collection('dataUserRm')
        .where('userRmUid', isEqualTo: _userRmModel.userRmUid)
        // .orderBy('dataUserRmTanggalPeriksa')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DataUserRmModel.fromDocument(doc);
      }).toList();
    });

    return StreamBuilder(
        stream: dataUserRmStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DataUserRmModel> _snapData = snapshot.data;

            if (_snapData.isNotEmpty) {
              return ListView.separated(
                itemCount: _snapData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(
                        _snapData[index].dataUserRmTanggalPeriksa))),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.idxDataUserRm,
                          arguments: [_userRmModel, _snapData[index]]);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 0.5);
                },
              );
            } else {
              return EmptyContentWidget(
                title: 'Data belum ada',
                message: '-',
              );
            }
          } else if (snapshot.hasError) {
            return EmptyContentWidget(
              title: 'Error found',
              message: 'Periksa koneksi internet.',
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
