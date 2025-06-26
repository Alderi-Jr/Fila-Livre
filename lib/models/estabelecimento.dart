
class Estabelecimento {
  final String nome;
  final String tipo;
  final int tempoEspera;
  final String imagemUrl;
  final List<String> caracteristicas;
  final int posicaoNaFila;

  const Estabelecimento({
    required this.nome,
    required this.tipo,
    required this.tempoEspera,
    required this.imagemUrl,
    required this.caracteristicas,
    required this.posicaoNaFila,
  });

}



final List<Estabelecimento> estabelecimentos = [
  Estabelecimento(
    nome: "Farmacia Erechim",
    tipo: "Farmacia",
    tempoEspera: 25,
    imagemUrl: "https://lh3.googleusercontent.com/p/AF1QipNVpsKiHDHYJlX-DW6UxKDU9sTgmKWumbZotB-6=s680-w680-h510-rw",
    caracteristicas: ["Medicamentos","Podutos de Beleza"],
    posicaoNaFila: 8,
  ),
  Estabelecimento(
    nome: "Churrascaria Alto Uuguai",
    tipo: "Churrascaria e Pizzaria",
    tempoEspera: 40,
    imagemUrl: "https://lh3.googleusercontent.com/gps-cs-s/AC9h4npmS5oCLFGPDqtI8H1cqgd0vl7VRZpDUtGvqQe2cqNy6EeL-aVzKXEfZsBtmVOvtyp67nrObxfp94aCj_OzaNb2fAcoH-6JD1lacwZXcqR4eqPFK82FXpJAoaNW0GelXlTlrtSr=s680-w680-h510-rw",
    caracteristicas: ["Pizza Boa", "Rodizio"],
    posicaoNaFila: 5,
  ),
  Estabelecimento(
    nome: "Cervejaria Ágape",
    tipo: "Cervejaria",
    tempoEspera: 15,
    imagemUrl: "https://www.agapecervejaria.com.br/site/_uploads/textos/1/0a30ea3425fb9ceb46bd65015c6aa7ec.jpg",
    caracteristicas: ["Cerveja Artesanal", "Atendimento VIP"],
    posicaoNaFila: 3,
  ),
  Estabelecimento(
    nome: "Master Sonda Shopping",
    tipo: "Mercado",
    tempoEspera: 10,
    imagemUrl: "https://grupomastersonda.com.br/master-supermercados/wp-content/uploads/sites/3/2020/05/Master-1024x576.jpg",
    caracteristicas: ["Auto-caixa", "Delivery"],
    posicaoNaFila: 12,
  ),
];

