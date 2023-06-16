import 'package:flutter/material.dart';
import 'package:projetobase/aula09/view/aula09_dashboard.dart';
import 'package:projetobase/aula09/view/aula09_disciplinas.dart';
import 'package:projetobase/aula12/view/cardapio_view.dart';

class Aula09 extends StatefulWidget {
  const Aula09({super.key});

  @override
  State<Aula09> createState() => _Aula09State();
}

class _Aula09State extends State<Aula09> {
  int _itemSelecionado = 0;
  final List<Widget> _subTelas = const [
    Aula09Dashboard(),
    Aula09Disciplinas(),
  ];
  // bool _deslogar = false;

  // _logoff() {
  //   if (_deslogar) {
  //     Navigator.of(context).pop;
  //   }
  // }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Você deseja deslogar?'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.check_circle_outline,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.cancel_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        );
      }),
    );
  }

  void _alterarBottomNav(int index) {
    if (index == 2) {
      _showDialog(context);
      return;
    }
    setState(() {
      _itemSelecionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _subTelas[_itemSelecionado],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _itemSelecionado,
          backgroundColor: Color.fromARGB(255, 76, 175, 80),
          selectedItemColor: Colors.white,
          onTap: _alterarBottomNav,
          items: const [
            BottomNavigationBarItem(
              label: 'Início',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Disciplinas',
              icon: Icon(Icons.book),
              activeIcon: Icon(Icons.menu_book),
            ),
            BottomNavigationBarItem(
              label: 'Sair',
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
