import 'package:flutter/material.dart';

enum TiposDeLogin { email, cpf, telefone }

enum TiposDeLoginEnhanced {
  email(
      label: 'E-Mail',
      hintText: 'usuario@email.com',
      prefixIcon: Icon(Icons.mail)),
  cpf(
      label: 'CPF',
      hintText: '111.111.111-11',
      prefixIcon: Icon(Icons.credit_card)),
  telefone(
      label: 'Telefone',
      hintText: '(11) 11111-1111',
      prefixIcon: Icon(Icons.phone));

  const TiposDeLoginEnhanced({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  final String label;
  final String hintText;
  final Icon prefixIcon;
}

// class LoginDetails {
//   late String label;
//   late String hintText;
//   late Icon prefixIcon;

//   LoginDetails({
//     required this.label,
//     required this.hintText,
//     required this.prefixIcon,
//   });

//   static Map<TiposDeLogin, LoginDetails> loginDetails() {
//     return {
//       TiposDeLogin.email: LoginDetails(
//           label: 'E-Mail',
//           hintText: 'usuario@email.com',
//           prefixIcon: const Icon(Icons.mail)),
//       TiposDeLogin.cpf: LoginDetails(
//           label: 'CPF',
//           hintText: '111.111.111-11',
//           prefixIcon: const Icon(Icons.credit_card)),
//       TiposDeLogin.telefone: LoginDetails(
//           label: 'Telefone',
//           hintText: '(11) 11111-1111',
//           prefixIcon: const Icon(Icons.phone))
//     };
//   }
// }
