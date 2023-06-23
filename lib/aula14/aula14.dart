import 'package:flutter/material.dart';
import 'package:projetobase/aula14/database/db_helper.dart';

class Aula14 extends StatelessWidget {
  const Aula14({super.key});

  Future<void> testatBanco() async {
    var db = await DBHelper.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: testatBanco,
                child: const Text('Executar demo do BD'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
