

import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/editor.dart';
import 'package:my_flutter_app/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloConta = 'Número da Conta';
const rotuloValor = 'Valor';
const textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloConta,
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: rotuloValor,
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(textoBotao),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}
