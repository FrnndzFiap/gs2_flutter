import 'package:flutter/material.dart';
import 'package:gs2/provider/eletropostos_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Eletropostos"),
        ),
        body:
            Consumer<EletropostosProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.eletropostosModel.isEmpty) {
            return Center(child: Text("nenhum eletroposto encontrado"));
          }

          return ListView.builder(
              itemCount: provider.eletropostosModel.length,
              itemBuilder: (context, index) {
                final EletropostosModel = provider.eletropostosModel[index];
                return ListTile(
                  title: Text(EletropostosModel.nome),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("informacoes: ${EletropostosModel.informacoes}"),
                      Text("endereco: ${EletropostosModel.endereco}"),
                      Text("telefone: ${EletropostosModel.telefone}"),
                      Text(
                          "conectores: ${EletropostosModel.conectores.join(', ')}"),
                    ],
                  ),
                );
              });
        }));
  }
}
