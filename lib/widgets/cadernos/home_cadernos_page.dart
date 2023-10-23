import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/providers/cadernos_provider.dart';
import 'package:your_matter/utils/constantes.dart';
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de colunas
              ),
              itemCount: notebooks.length,
              itemBuilder: (context, index) {
                final notebook = notebooks[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: GestureDetector(
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Quer mesmo excluir esse caderno?'),
                          content:
                              const Text('Esta ação não poderá ser desfeita!'),
                          actions: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context, 'Cancel'),
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(103, 33, 149, 243),
                                    borderRadius:
                                        BorderRadius.circular(defaultpd)),
                                child: const Center(
                                    child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 56, 99),
                                  ),
                                )),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                try {
                                  await pageControl.deletePageById(notebook);
                                } catch (e) {
                                  print('Erro ao tentar excluir caderno: ($e)');
                                }
                              },
                              child: const Text(
                                'Excluir',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onTap: () {
                      Get.to(
                        NewPage(
                          note: myPage(
                            id: notebook.id,
                            content: notebook
                                .content, // Preencha com o conteúdo existente
                            searchableDocument: notebook
                                .searchableDocument, // Preencha com o documento existente
                            title: notebook
                                .title, // Preencha com o título existente
                            turma: notebook.turma,
                            uid: notebook.uid,
                          ),
                          isNewNote: false, // Defina conforme necessário
                        ),
                      );
                    },
                    child: CardCaderno(
                      title: notebook.title,
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
