import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/estabelecimento_screen.dart';
import 'screens/fila_screen.dart';
import 'screens/login_screen.dart';
import 'models/estabelecimento.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FilaLivreApp());
}

class FilaLivreApp extends StatelessWidget {
  const FilaLivreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fila Livre',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(), // Tela inicial direta
      routes: {
        '/login': (context) => const LoginScreen(),
        '/estabelecimentos': (context) => const EstabelecimentoScreen(),
        '/fila': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args == null || args is! Estabelecimento) {
            Navigator.pop(context);
            return const Center(child: Text('Erro: Estabelecimento não encontrado'));
          }
          return FilaScreen(estabelecimento: args);
        },
      },
    );
  }
}