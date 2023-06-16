import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> getInstance() async {
    String dbname = 'aula14.db';
    String path = await getDatabasesPath() + dbname;
    var instance = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onOpen: _onOpen,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
    );
    return instance;
  }

  static Future<void> _onCreate(Database db, int version) async {
    debugPrint(' ******** CREATE ********* ');
    await db.execute(
        "CREATE TABLE aluno (id INTEGER PRIMARY KEY, matricula TEXT, nome TEXT)");
  }

  static Future<void> _onOpen(Database db) async {
    var version = await db.getVersion();
    debugPrint(' ******** OPENING (ver. $version) ********* ');
  }

  static Future<void> _onUpgrade(Database db, int oldV, int newV) async {
    // Scripts de alteração de Banco de Dados
    debugPrint(' ******** UPGRADING (ver. $oldV -> $newV) ********* ');
  }

  static Future<void> _onDowngrade(Database db, int oldV, int newV) async {
    // Scripts de alteração de Banco de Dados
    debugPrint(' ******** DOWNGRAGING (ver. $oldV -> $newV) ********* ');
  }
}
