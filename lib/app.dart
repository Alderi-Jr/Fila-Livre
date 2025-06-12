import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/estabelecimento_screen.dart';
import 'screens/fila_screen.dart';

class FilaLivreApp extends StatelessWidget {
  const FilaLivreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fila Livre',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/estabelecimentos': (_) => const EstabelecimentoScreen(),
        '/fila': (_) => const FilaScreen(),
      },
    );
  }
}
