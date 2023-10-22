import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/providers/cadernos_provider.dart';
import 'package:your_matter/widgets/cadernos/card_cadernos.dart';

class MeusCadernos extends StatefulWidget {
  const MeusCadernos({Key? key}) : super(key: key);

  @override
  _MeusCadernosState createState() => _MeusCadernosState();
}

class _MeusCadernosState extends State<MeusCadernos> {
  @override
  Widget build(BuildContext context) {
    final pageControl = PageControl();

    return Scaffold(
      body: StreamBuilder<List<myPage>>(
        stream: pageControl.getPagesForCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            final notebooks = snapshot.data;
            if (notebooks == null || notebooks.isEmpty) {
              return Text('Nenhum caderno encontrado.');
            }

            return ListView.builder(
              itemCount: notebooks.length,
              itemBuilder: (context, index) {
                final notebook = notebooks[index];
                return CardCaderno(
                  title: notebook.title,

                  // Passe os campos adicionais do caderno conforme necessário
                );
              },
            );
          }
        },
      ),
    );
  }
}
