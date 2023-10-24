import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/providers/cadernos_provider.dart';
import 'package:your_matter/resources/modal_bottom_sheet.dart';
import 'package:your_matter/widgets/cadernos/card_cadernos.dart';

import '../../views/functions/create_Page.dart';

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
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            final notebooks = snapshot.data;
            if (notebooks == null || notebooks.isEmpty) {
              return const Center(child: Text('Nenhum caderno encontrado.'));
            }

            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.5,
                crossAxisCount: 2, // Número de colunas
              ),
              itemCount: notebooks.length,
              itemBuilder: (context, index) {
                final notebook = notebooks[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: GestureDetector(
                    onLongPress: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MyModalBottomSheet(
                              note: notebook,
                            );
                          });
                    },
                    onTap: () {
                      Get.to(
                        NewPage(
                          note: myPage(
                              id: notebook.id,
                              content: notebook.content,
                              searchableDocument: notebook.searchableDocument,
                              title: notebook.title,
                              turma: notebook.turma,
                              uid: notebook.uid,
                              bgColor: notebook.bgColor,
                              borderColor: notebook.borderColor),
                          isNewNote: false,
                        ),
                      );
                    },
                    child: CardCaderno(
                      note: notebook,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
