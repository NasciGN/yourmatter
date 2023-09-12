import 'package:flutter/material.dart';

import '../../utils/constantes.dart';

class MeusCadernos extends StatefulWidget {
  const MeusCadernos({super.key});

  @override
  State<MeusCadernos> createState() => _MeusCadernosState();
}

class _MeusCadernosState extends State<MeusCadernos> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(defaultpd),
      child: Text('Cadernos'),
    );
  }
}
