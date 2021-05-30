import 'package:flutter/material.dart';

class RekamMedikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          flex: 1,
          // width: width,
          // color: Colors.blueGrey.shade50,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'User Rekam Medik',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 50),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/crud-user-rm'),
                  child: Text('Tambah Data'))
              // AddButton(width: width)
            ],
          ),
        ),
      ],
    );
  }
}
