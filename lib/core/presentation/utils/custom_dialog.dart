import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String platform;

  const CustomDialog({Key? key, required this.platform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Botón presionado'),
      content: Text('Presionaste el botón de $platform'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Cerrar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
