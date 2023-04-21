import 'package:flutter/material.dart';

import '../widgets/tipo_login.dart';

class LoginDetails {
  late String label;
  late String hintText;
  late Icon prefixIcon;

  LoginDetails({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  static Map<TiposLogin, LoginDetails> loginDetails() {
    return {};
  }
}
