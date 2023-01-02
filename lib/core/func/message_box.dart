import 'package:flutter/material.dart';

Future<dynamic> messageBox(context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('تأكيد الحذف'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            return Navigator.pop(context, 'ok');
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
