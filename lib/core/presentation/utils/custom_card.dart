import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  const CardForm({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: margin,
      padding: padding ?? EdgeInsets.fromLTRB(40, 40, 40, (paddingBottom + 6)),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: alignment,
      child: child,
    );
  }
}
