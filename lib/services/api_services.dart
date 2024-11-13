import 'dart:convert';

import 'package:gs2/models/eletropostos_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl =
      'https://eletropostos.azurewebsites.net/api/eletroposto';
  Future<List<EletropostosModel>> getEletropostos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List list = json.decode(response.body);
      final List<EletropostosModel> eletropostos =
          list.map((json) => EletropostosModel.fromJson(json)).toList();
      return eletropostos;
    } else {
      throw Exception('falha ao carregar eletropostos');
    }
  }
}
