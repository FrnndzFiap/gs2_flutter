class EletropostosModel {
  final String id;
  final String nome;
  final String informacoes;
  final String endereco;
  final String telefone;
  final List<String> conectores;

  EletropostosModel(
      {required this.id,
      required this.nome,
      required this.informacoes,
      required this.endereco,
      required this.telefone,
      required this.conectores});

  factory EletropostosModel.fromJson(Map<String, dynamic> json) {
    return EletropostosModel(
        id: json["id"],
        nome: json["nome"],
        informacoes: json["informacoes"],
        endereco: json["endereco"],
        telefone: json["telefone"],
        conectores: List<String>.from(json["conectores"]));
  }
}
