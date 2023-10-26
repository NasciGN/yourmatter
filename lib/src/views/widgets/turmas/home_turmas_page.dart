import 'package:flutter/material.dart';
import 'package:your_matter/src/core/colors/custom_colors.dart';

class MinhasTurmas extends StatefulWidget {
  const MinhasTurmas({super.key});

  @override
  State<MinhasTurmas> createState() => _MinhasTurmasState();
}

class _MinhasTurmasState extends State<MinhasTurmas> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(defaultpd),
      child: Center(child: Text('Em breve')),
    );
  }
}
