import 'package:filalivre/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../models/estabelecimento.dart';

class EstabelecimentoScreen extends StatelessWidget {
  const EstabelecimentoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acompanhamento da Fila'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: estabelecimentos.length,
        itemBuilder: (context, index) {
          final est = estabelecimentos[index];
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(est.imagemUrl),
                        fit: BoxFit.cover,
                        onError: (_, __) => const Icon(Icons.business, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    est.nome,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "⏳ ${est.tempoEspera} min • 🏷️ ${est.tipo}",
                    style: TextStyle(color: Colors.teal[700]),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    children: est.caracteristicas
                        .map((item) => Chip(
                      label: Text(item),
                      padding: EdgeInsets.zero,
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                   ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/fila',
                        arguments: est,
                      );
                    },
                    child: const Text("Entrar na Fila"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}