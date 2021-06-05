import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simrs_mata/models/data_user_rm_model.dart';
import 'package:simrs_mata/models/user_rm_model.dart';
import 'package:simrs_mata/ui/app_drawer/app_drawer.dart';
import 'package:simrs_mata/ui/data_rekam_medik_page/uploading_h2.dart';

class IdxDataUserRekamMedikPage extends StatefulWidget {
  @override
  _IdxDataUserRekamMedikPageState createState() =>
      _IdxDataUserRekamMedikPageState();
}

class _IdxDataUserRekamMedikPageState extends State<IdxDataUserRekamMedikPage> {
  UserRmModel _userRmModel;
  DataUserRmModel _dataUserRmModel;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    List aa = ModalRoute.of(context).settings.arguments;
    _userRmModel = aa[0];
    _dataUserRmModel = aa[1];
  }

  @override
  Widget build(BuildContext context) {
    // final _docs = Provider.of<List<DataUserRmModel>>(context);

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('View Rekam Medik ${_userRmModel.userRmNama}'),
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
                      Text(_userRmModel.userRmNama ?? ''),
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
                  Row(
                    children: [
                      Text('Tanggal Periksa:'),
                      SizedBox(width: 8),
                      Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          _dataUserRmModel.dataUserRmTanggalPeriksa))),
                    ],
                  ),
                  // SizedBox(height: 10),
                  // SizedBox(
                  //   height: 40,
                  //   width: 200,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Text('Update Hasil 1'),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: UploadingH2(
                      a: _userRmModel.userRmUid,
                      b: _dataUserRmModel.dataUserRmTanggalPeriksa,
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
