import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projetobase/aula15/http/dio_client.dart';
import 'package:projetobase/aula15/widget/fipe_dropdown_button.dart';

import '../classes/marca.dart';
import '../classes/modelo.dart';

class ConsultaFipeView extends StatefulWidget {
  const ConsultaFipeView({super.key});

  @override
  State<ConsultaFipeView> createState() => _ConsultaFipeViewState();
}

class _ConsultaFipeViewState extends State<ConsultaFipeView> {
  late Dio _dio;
  final _veiculos = ['Carros', 'Motos', 'Caminhoes'];
  List<Marca> _marcas = [];
  List<Modelo> _modelos = [];

  String? _veiculo;
  Marca? _marca;
  Modelo? _modelo;

  var _carregandoMarcas = false;
  var _carregandoModelos = false;

  void _serverError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: SizedBox(
          height: 16,
          child: Center(
            child: Text('Erro no Servidor'),
          ),
        ),
      ),
    );
  }

  Future<void> mudarVeiculo(novo) async {
    var backup = _veiculo;
    setState(() {
      _veiculo = novo;
      _carregandoMarcas = true;
    });

    try {
      var response = await _dio.get('/${_veiculo!.toLowerCase()}/marcas');
      _marcas = response.data.map<Marca>((m) => Marca.fromMap(m)).toList();
      _marca = null;
    } on DioException catch (_) {
      _serverError();
      _veiculo = backup;
    }

    setState(() {
      _carregandoMarcas = false;
    });
  }

  Future<void> mudarMarca(nova) async {
    var backup = _marca;
    setState(() {
      _marca = _marcas.singleWhere((m) => m.codigo == nova);
      _carregandoModelos = true;
    });

    try {
      var response =
          await _dio.get('/${_veiculo!.toLowerCase()}/marcas/$nova/modelos');
      _modelos = response.data['modelos']
          .map<Modelo>((m) => Modelo.fromMap(m))
          .toList();
      _modelo = null;
    } on DioException catch (_) {
      _serverError();
      _marca = backup;
    }

    setState(() {
      // _veiculo = novo;
      _carregandoModelos = false;
    });
  }

  @override
  void initState() {
    DioClient.instance.then((instance) => _dio = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabela Fipe'),
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  const Text('Consulta à tabela Fipe'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Veículo'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            hint: 'Selecione um Veículo',
                            value: _veiculo,
                            items: _veiculos
                                .map(
                                  (v) => DropdownMenuItem(
                                    value: v,
                                    child: Text(v),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: mudarVeiculo,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Marca'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            loading: _carregandoMarcas,
                            hint: 'Selecione uma Marca',
                            value: _marca?.codigo,
                            items: _marcas
                                .map(
                                  (m) => DropdownMenuItem(
                                    value: m.codigo,
                                    child: Text(m.nome),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: mudarMarca,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Modelo'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FipeDropdownButton(
                            loading: _carregandoModelos,
                            hint: 'Selecione um Modelo',
                            value: _modelo?.codigo.toString(),
                            items: _modelos
                                .map(
                                  (m) => DropdownMenuItem(
                                    value: m.codigo.toString(),
                                    child: Text(m.nome),
                                  ),
                                )
                                .toList(),
                            onChangeFunc: mudarMarca,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
