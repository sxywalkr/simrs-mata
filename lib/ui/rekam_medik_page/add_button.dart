import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simrs_mata/models/user_rm_model.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    // final _linksCollection = Provider.of<CollectionReference>(context);
    TextEditingController _titleTextController = TextEditingController();
    TextEditingController _urlTextController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return SizedBox(
      width: width,
      child: TextButton(
        // padding: EdgeInsets.symmetric(vertical: 25),
        // shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(15),
        // ),
        child: Text('Add button'),
        // color: Colors.greenAccent.shade400,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tambah User RM'),
                contentPadding: EdgeInsets.all(32.0),
                content: FormTambahUserRm(
                    formKey: _formKey,
                    titleTextController: _titleTextController,
                    urlTextController: _urlTextController),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // _linksCollection.add(
                        //   LinkData(
                        //     title: _titleTextController.text,
                        //     url: _urlTextController.text,
                        //   ).toMap(),
                        // );

                        Navigator.of(context).pop();
                        _formKey.currentState.reset();
                      }
                    },
                    child: Text('Tambah'),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel')),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class FormTambahUserRm extends StatefulWidget {
  const FormTambahUserRm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController titleTextController,
    @required TextEditingController urlTextController,
  })  : _formKey = formKey,
        _titleTextController = titleTextController,
        _urlTextController = urlTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleTextController;
  final TextEditingController _urlTextController;

  @override
  _FormTambahUserRmState createState() => _FormTambahUserRmState();
}

class _FormTambahUserRmState extends State<FormTambahUserRm> {
  String dropdownValue = 'Laki-laki';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value) {
                return value.isEmpty ? 'Masukkan NIK' : null;
              },
              controller: widget._titleTextController,
              decoration: InputDecoration(
                labelText: 'NIK',
                hintText: 'Nomor Induk Kependudukan',
              ),
            ),
            TextFormField(
              validator: (value) {
                return value.isEmpty ? 'Masukkan Nama' : null;
              },
              controller: widget._urlTextController,
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Nama',
              ),
            ),
            TextFormField(
              validator: (value) {
                return value.isEmpty ? 'Masukkan Tempat Lahir' : null;
              },
              controller: widget._urlTextController,
              decoration: InputDecoration(
                labelText: 'Tempat Lahir',
                hintText: 'Tempat lahir',
              ),
            ),
            TextFormField(
              validator: (value) {
                return value.isEmpty ? 'Masukkan Tanggal Lahir' : null;
              },
              controller: widget._urlTextController,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir (Tahun/Bulan/Tanggal)',
                hintText: 'YYYY/MM/DD',
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              // style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                // color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Laki-laki', 'Perempuan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
