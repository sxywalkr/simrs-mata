import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Made in Flutter with Love',
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(width: 8),
        Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQw_udnwaWxgKQ6BftIrjn8UGXWoaTN9xiVQ&usqp=CAU',
          width: 25,
        )
      ],
    );
  }
}
