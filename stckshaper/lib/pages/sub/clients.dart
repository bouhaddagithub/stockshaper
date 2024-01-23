import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/client_module.dart';
import 'package:stckshaper/widgets/client_row.dart';

class ClientsWidget extends StatelessWidget {
  const ClientsWidget({
    super.key,
    required this.clients,
  });

  final List<Client> clients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          clients.length,
          (i) => ClientRow(
            client: clients[i],
          ),
        ),
        // if (clients.isNotEmpty)
        //   for (Client client in clients) ClientRow(client: client),
        // if (clients.isEmpty) ClientRow(client: Client.empty()),
        // if (products.isNotEmpty)
        //   for (Product product in products)
        //     ProductRow(product: product),
        // if (categories.isNotEmpty)
        //   for (Groupe category in categories)
        //     CategoryRow(category: category),
        // if (categories.isEmpty) CategoryRow(category: Groupe.empty()),
    );
  }
}
