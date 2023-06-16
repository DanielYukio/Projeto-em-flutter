import 'package:flutter/material.dart';
import 'package:projetobase/aula08/aula08.dart';
import 'package:projetobase/aula09/aula09.dart';
import 'package:projetobase/aula09/view/aula09_dashboard.dart';
import 'package:projetobase/aula09/view/aula09_disciplinas.dart';
import 'package:projetobase/aula10/aula10.dart';
import 'package:projetobase/aula10/view/aula10_future.dart';
import 'package:projetobase/aula12/model/carrinho_model.dart';
import 'package:projetobase/aula12/view/cardapio_view.dart';
import 'package:projetobase/aula12/view/pedido_view.dart';
import 'package:projetobase/aula13/theme/color_schemes2.g.dart';
import 'package:projetobase/aula14/view/lista_alunos_view.dart';
import 'package:provider/provider.dart';

import 'aula14/aula14.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      // home: const CardapioView(),
      routes: {
        '/': (context) => const Aula08(),
        '/aula09': (context) => const Aula09(),
        '/aula09_dashboard': (context) => const Aula09Dashboard(),
        '/aula09_disciplinas': (context) => const Aula09Disciplinas(),
        '/aula10': (context) => const Aula10(),
        '/aula10_future': (context) => const Aula10Future(),
        '/cardapio': (context) => const CardapioView(),
        '/pedidos': (context) => const PedidoView(),
        '/aula14': (context) => const Aula14(),
        '/listaAlunos': (context) => const ListaAlunosView(),
      },
    );
  }
}
