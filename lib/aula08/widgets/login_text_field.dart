import 'package:flutter/material.dart';
import 'package:projetobase/aula08/classes/login_details.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.tipoLogin,
    required controller,
  }) : _controller = controller;

  final TextEditingController _controller;
  final TiposDeLoginEnhanced tipoLogin;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // userName
      controller: widget._controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text(widget.tipoLogin.label),
        hintText: widget.tipoLogin.hintText,
        border: const OutlineInputBorder(),
        prefixIcon: widget.tipoLogin.prefixIcon,
      ),
      inputFormatters: widget.tipoLogin.textInputFormatters(),
    );
  }
}
