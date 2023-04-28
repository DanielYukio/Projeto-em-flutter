import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:projetobase/aula08/classes/login_details.dart';
import 'package:projetobase/aula08/widgets/login_text_field.dart';
import 'package:projetobase/aula08/widgets/tipo_login.dart';
import 'package:projetobase/aula09/aula09.dart';

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
  TiposDeLoginEnhanced tipoLogin = TiposDeLoginEnhanced.email;
  bool _memorizar = false;

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
      tipoLogin = TiposDeLoginEnhanced.values[index];
      _selectedList =
          _selectedList.mapIndexed((idx, val) => idx == index).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: 240,
                  image: AssetImage('assets/images/ifsplogo.png'),
                ),
                const SizedBox(height: 8),
                TipoLogin(
                  selectedList: _selectedList,
                  alterarTipoLogin: _alterarTipoLogin,
                ),
                const SizedBox(height: 16),
                LoginTextField(
                  tipoLogin: tipoLogin,
                  controller: _userController,
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
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Memorizar dados'),
                    const SizedBox(
                      width: 8,
                    ),
                    Switch(
                      value: _memorizar,
                      onChanged: (value) => {
                        setState(() {
                          _memorizar = value;
                        })
                      },
                    )
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.75,
                      35,
                    ),
                  ),
                  onPressed: () {
                    _testFields();
                    Navigator.pushNamed(
                      context,
                      '/aula09',
                      arguments: {'nome': 'Dourado'},
                    );
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
