import 'package:flutter/material.dart';
import 'package:your_matter/src/models/page.dart';
import 'package:your_matter/src/controllers/cadernos_provider.dart';
import 'package:your_matter/src/utils/constantes.dart';

class MyModalBottomSheet extends StatefulWidget {
  final myPage note;
  const MyModalBottomSheet({super.key, required this.note});

  @override
  State<MyModalBottomSheet> createState() => _MyModalBottomSheetState();
}

class _MyModalBottomSheetState extends State<MyModalBottomSheet> {
  final pageControl = PageControl();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: new Icon(Icons.color_lens),
            title: new Text('Cor do caderno'),
            onTap: () {
              Navigator.pop(context);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      title: const Text('Escolha uma cor'),
                      content: Container(
                        height: 250.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print('teste Amarelo');
                                pageControl.changeColorCard(
                                    widget.note,
                                    bookYellow["bgColor"],
                                    bookYellow["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Amarelo'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookYellow["bgColor"]![0],
                                        bookYellow["bgColor"]![1],
                                        bookYellow["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('teste Azul');
                                pageControl.changeColorCard(
                                    widget.note,
                                    bookBlue["bgColor"],
                                    bookBlue["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Azul'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookBlue["bgColor"]![0],
                                        bookBlue["bgColor"]![1],
                                        bookBlue["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('teste Marrom');
                                pageControl.changeColorCard(
                                    widget.note,
                                    bookBrown["bgColor"],
                                    bookBrown["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Marrom'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookBrown["bgColor"]![0],
                                        bookBrown["bgColor"]![1],
                                        bookBrown["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('teste Verde');
                                pageControl.changeColorCard(
                                    widget.note,
                                    bookGreen["bgColor"],
                                    bookGreen["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Verde'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookGreen["bgColor"]![0],
                                        bookGreen["bgColor"]![1],
                                        bookGreen["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('teste Vermelho');
                                pageControl.changeColorCard(widget.note,
                                    bookRed["bgColor"], bookRed["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Vermelho'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookRed["bgColor"]![0],
                                        bookRed["bgColor"]![1],
                                        bookRed["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('teste Roxo');
                                pageControl.changeColorCard(
                                    widget.note,
                                    bookPurple["bgColor"],
                                    bookPurple["borderColor"]);
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text('Roxo'),
                                  Spacer(),
                                  Icon(
                                    Icons.color_lens,
                                    color: Color.fromARGB(
                                        255,
                                        bookPurple["bgColor"]![0],
                                        bookPurple["bgColor"]![1],
                                        bookPurple["bgColor"]![2]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )));
            },
          ),
          ListTile(
            leading: new Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            title: new Text(
              'Excluir caderno',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Quer mesmo excluir esse caderno?'),
                  content: const Text('Esta ação não poderá ser desfeita!'),
                  actions: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context, 'Cancel'),
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(103, 33, 149, 243),
                            borderRadius: BorderRadius.circular(defaultpd)),
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
                          await pageControl.deletePageById(widget.note);
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
          ),
        ],
      ),
    );
  }
}
