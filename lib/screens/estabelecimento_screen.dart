import 'package:flutter/material.dart';
import '../models/estabelecimento.dart';

class EstabelecimentoScreen extends StatelessWidget {
  const EstabelecimentoScreen({super.key});

  final List<Estabelecimento> estabelecimentos = const [
    Estabelecimento(nome: "Restaurante Bom Sabor", tipo: "Restaurante", tempoEspera: 15),
    Estabelecimento(nome: "Clínica Vida+", tipo: "Clínica", tempoEspera: 30),
    Estabelecimento(nome: "Salão Estilo", tipo: "Salão", tempoEspera: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escolha o Estabelecimento")),
      body: ListView.builder(
        itemCount: estabelecimentos.length,
        itemBuilder: (context, index) {
          final est = estabelecimentos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(est.nome),
              subtitle: Text("${est.tipo} - Espera: ${est.tempoEspera} min"),
              trailing: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Você entrou na fila de ${est.nome}'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  Navigator.pushNamed(context, '/fila');
                },
                icon: const Icon(Icons.login),
                label: const Text("Entrar"),
              ),
            ),
          );
        },
      ),
    );
  }
}
