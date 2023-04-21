import 'package:flutter/material.dart';

enum TiposDeLogin { email, cpf, telefone }

class LoginDetails {
  late String label;
  late String hintText;
  late Icon prefixIcon;

  LoginDetails({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  static Map<TiposDeLogin, LoginDetails> loginDetails() {
    return {
      TiposDeLogin.email: LoginDetails(
          label: 'E-Mail',
          hintText: 'usuario@email.com',
          prefixIcon: const Icon(Icons.mail)),
      TiposDeLogin.cpf: LoginDetails(
          label: 'CPF',
          hintText: '111.111.111-11',
          prefixIcon: const Icon(Icons.credit_card)),
      TiposDeLogin.telefone: LoginDetails(
          label: 'Telefone',
          hintText: '(11) 11111-1111',
          prefixIcon: const Icon(Icons.phone))
    };
  }
}
