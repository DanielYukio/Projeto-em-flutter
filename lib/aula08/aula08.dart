import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:projetobase/aula08/widgets/tipo_login.dart';

// stf para gerar o statefulWidget

class Aula08 extends StatefulWidget {
  const Aula08({super.key});

  @override
  State<Aula08> createState() => _Aula08State();
}

class _Aula08State extends State<Aula08> {
  bool _showPassword = false;
  late final TextEditingController _userController;
  late final TextEditingController _senhaController;
  List<bool> _selectedList = [true, false, false];

  @override
  void initState() {
    _userController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _testFields() {
    debugPrint('Usuario: ${_userController.text}');
    debugPrint('Senha: ${_senhaController.text}');
  }

  void _alterarTipoLogin(int index) {
    setState(() {
      // for (int i = 0; i < _selectedList.length; i++) {
      //   _selectedList[i] = i == index ? true : false;
      // }

      // _selectedList = index == 0
      //     ? [true, false, false]
      //     : index == 1
      //         ? [false, true, false]
      //         : index == 2
      //             ? [false, false, true]
      //             : [false, false, false];

      _selectedList =
          _selectedList.mapIndexed((idx, val) => idx == index).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TiposLogin(
                selectedList: _selectedList,
                alterarTipoLogin: _alterarTipoLogin,
              ),
              const SizedBox(height: 16),
              TextField(
                // userName
                controller: _userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                  hintText: 'user@email.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _senhaController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  label: const Text('Senha'),
                  hintText: 'Senha',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () => _toggleVisibility(),
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.75,
                    30,
                  ),
                ),
                onPressed: _testFields,
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
