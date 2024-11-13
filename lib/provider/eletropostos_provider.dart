import 'package:flutter/material.dart';
import 'package:gs2/models/eletropostos_model.dart';
import 'package:gs2/services/api_services.dart';

class EletropostosProvider with ChangeNotifier {
  List<EletropostosModel> _eletropostosModel = [];
  List<EletropostosModel> get eletropostosModel => _eletropostosModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final ApiServices _apiServices = ApiServices();

  Future<void> listEletropostos() async {
    _isLoading = true;
    try {
      _eletropostosModel = await _apiServices.getEletropostos();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
