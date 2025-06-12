import 'package:flutter/material.dart';

class FilaScreen extends StatefulWidget {
  const FilaScreen({super.key});

  @override
  State<FilaScreen> createState() => _FilaScreenState();
}

class _FilaScreenState extends State<FilaScreen> {
  int posicao = 5;
  int tempoEspera = 20;

  @override
  Widget build(BuildContext context) {
    final double progresso = 1 - (posicao / 10);

    return Scaffold(
      appBar: AppBar(title: const Text("Acompanhamento da Fila")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Sua posição na fila: $posicao",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              "Tempo estimado de espera: $tempoEspera minutos",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(value: progresso),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Sair da fila"),
            ),
          ],
        ),
      ),
    );
  }
}
