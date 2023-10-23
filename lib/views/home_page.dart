import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_matter/models/page.dart';
import 'package:your_matter/resources/auth.dart';
import 'package:your_matter/utils/constantes.dart';
import 'package:your_matter/views/functions/create_Page.dart';
import '../widgets/cadernos/home_cadernos_page.dart';
import '../widgets/turmas/home_turmas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String displayName = 'Nome';
  String onlineUserName = '';
  late User onlineUser;
  bool? _isprofessor;
  late TabController _tabController;

  void CreateNewNote() {
    myPage newNote = myPage(
        id: '',
        content: '',
        searchableDocument: '',
        title: '',
        turma: '',
        uid: '');

    goToNewPage(newNote, true);
  }

  void goToNewPage(myPage note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewPage(
                  note: note,
                  isNewNote: isNewNote,
                )));
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        onlineUser = user;
        onlineUserName = user.displayName ?? '';
        bool? isProfessor = await isUserProfessor(onlineUser.uid);
        setState(() {
          _isprofessor = isProfessor;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            myPage newNote = myPage(
                id: '',
                content: '',
                searchableDocument: '',
                title: '',
                turma: '',
                uid: '');
            bool teste = true;
            goToNewPage(newNote, teste);
          },
          backgroundColor: btnColor,
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Olá, $onlineUserName',
                  style: const TextStyle(
                      fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/account');
                  },
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(defaultpd),
          child: TabBar(
            unselectedLabelColor: Colors.black38,
            splashFactory: NoSplash.splashFactory,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Meus Cadernos',
                  style: GoogleFonts.roboto(
                      color: bgColor,
                      letterSpacing: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                  child: Text('Minhas Turmas',
                      style: GoogleFonts.roboto(
                          color: bgColor,
                          letterSpacing: 1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)))
            ],
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3, // Largura da linha inferior
                color: bgColor, // Cor da linha inferior quando selecionada
              ),
              insets: EdgeInsets.symmetric(
                  horizontal: 16), // Espaçamento à esquerda e à direita
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: const [MeusCadernos(), MinhasTurmas()]),
        )
      ])),
    );
  }
}
