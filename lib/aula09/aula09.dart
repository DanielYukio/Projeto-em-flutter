import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetobase/aula09/view/aula09_dashboard.dart';
import 'package:projetobase/aula09/view/aula09_disciplinas.dart';

class Aula09 extends StatefulWidget {
  const Aula09({super.key});

  @override
  State<Aula09> createState() => _Aula09State();
}

class _Aula09State extends State<Aula09> {
  int _itemSelecionado = 0;
  final List<Widget> _subTelas = const [Aula09Dashboard(), Aula09Disciplinas()];

  void _alterarBottomNav(int index) {
    if (index == 2) {
      Navigator.pop(context);
    }
    setState(() {
      _itemSelecionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _subTelas[_itemSelecionado],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _itemSelecionado,
          backgroundColor: Colors.green,
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
                activeIcon: Icon(Icons.menu_book)),
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
