import 'package:flutter/material.dart';

class CustomInfo extends StatelessWidget {
  final String titulo;
  final String data;

  CustomInfo({required this.titulo, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 1),
      decoration: BoxDecoration(
        color:Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Text(
            data ,
            style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge!.color,),
          ),
          const SizedBox(height: 10),
          Text(
            titulo,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
