import 'package:filalivre/screens/login_screen.dart';
import 'package:filalivre/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../services/local_storage.dart';
import '../models/estabelecimento.dart';

class FilaScreen extends StatefulWidget {
  final Estabelecimento estabelecimento;

  const FilaScreen({super.key, required this.estabelecimento});

  @override
  State<FilaScreen> createState() => _FilaScreenState();
}

class _FilaScreenState extends State<FilaScreen> {
  int posicao = 5;
  int tempoEspera = 20;

  @override
  void initState() {
    super.initState();
    _carregarPosicaoSalva();
  }

  Future<void> _carregarPosicaoSalva() async {
    final dados = await LocalStorage.carregarPosicao();
    setState(() {
      posicao = dados['posicao']!;
      tempoEspera = dados['tempoEspera']!;
    });
  }

  void atualizarFila() async {
    setState(() {
      if (posicao > 0) {
        posicao--;
        tempoEspera -= 4;
      }
    });
    await LocalStorage.salvarPosicao(posicao, tempoEspera);
  }

  @override
  Widget build(BuildContext context) {
    final progresso = 1 - (posicao / 10);
    final ThemeData theme = Theme.of(context);
    final animation = Tween(begin: 0.0, end: progresso).animate(
      CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.estabelecimento.imagemUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.estabelecimento.nome,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.category, size: 16, color: theme.hintColor),
                      const SizedBox(width: 4),
                      Text(widget.estabelecimento.tipo),
                    ],
                  ),

                  const SizedBox(height: 24),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "POSIÇÃO ATUAL",
                                    style: theme.textTheme.labelSmall,
                                  ),
                                  Text(
                                    "$posicaoª",
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TEMPO ESTIMADO",
                                    style: theme.textTheme.labelSmall,
                                  ),
                                  Text(
                                    "$tempoEspera min",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          AnimatedBuilder(
                            animation: animation,
                            builder:
                                (_, __) => LinearProgressIndicator(
                                  value: animation.value,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(10),
                                  color: theme.colorScheme.primary,
                                  backgroundColor: theme.colorScheme.primary
                                      .withOpacity(0.2),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: atualizarFila,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Atualizar Minha Posição"),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      await LocalStorage.limparPosicao();
                      Navigator.pop(context);
                    },
                    child: const Text("Sair da Fila"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await AuthService.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
