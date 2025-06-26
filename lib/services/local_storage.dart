import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _posicaoKey = 'posicao_na_fila';
  static const _tempoKey = 'tempo_espera';

  static Future<void> salvarPosicao(int posicao, int tempoEspera) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_posicaoKey, posicao);
    await prefs.setInt(_tempoKey, tempoEspera);
  }

  static Future<Map<String, int>> carregarPosicao() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'posicao': prefs.getInt(_posicaoKey) ?? 5, // Valor padrão se não existir
      'tempoEspera': prefs.getInt(_tempoKey) ?? 20,
    };
  }

  static Future<void> limparPosicao() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_posicaoKey);
    await prefs.remove(_tempoKey);
  }
}