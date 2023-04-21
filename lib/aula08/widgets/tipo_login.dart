import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TiposLogin extends StatefulWidget {
  const TiposLogin({
    super.key,
    required this.selectedList,
    required this.alterarTipoLogin,
  });

  final List<bool> selectedList;
  final Function(int) alterarTipoLogin;

  @override
  State<TiposLogin> createState() => _TiposLoginState();
}

class _TiposLoginState extends State<TiposLogin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Logar com: '),
        const SizedBox(width: 8),
        ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          isSelected: widget.selectedList,
          onPressed: widget.alterarTipoLogin,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('E-mail'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('CPF'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('E-Telefone'),
            ),
          ],
        )
      ],
    );
  }
}
