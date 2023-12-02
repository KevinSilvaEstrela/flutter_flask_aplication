import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final List<String> integrantes = ['Kevin Silva Estrela RA: 1431432312035', 'Lucas Barbosa de Oliveira Ra: 1431432312031', 'Bruno Santos Ramos Pequeno RA: 1431432212033', 'Victor Henrique Cavalcante Batista RA: 1431432312035', 'Vitor Aquino dos Santos RA: 1431432312010'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integrantes da Equipe'),
      ),
      body: ListView.builder(
        itemCount: integrantes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(integrantes[index]),
              // Adicione mais informações ou ações aqui, se necessário
            ),
          );
        },
      ),
    );
  }
}