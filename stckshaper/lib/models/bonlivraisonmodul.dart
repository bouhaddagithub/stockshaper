class BonLivraison {
  int id;
  DateTime date;
  double oldReste;
  double reste;
  double payment;
  int clientId; // Assuming a foreign key to the "clients" table
  int userId; // Assuming a foreign key to the "users" table

  BonLivraison({
    required this.id,
    required this.date,
    required this.oldReste,
    required this.reste,
    required this.payment,
    required this.clientId,
    required this.userId,
  });

  // Convert a BonLivraison object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'old_reste': oldReste,
      'reste': reste,
      'payment': payment,
      'id_client': clientId,
      'id_user': userId,
    };
  }

  // Create a BonLivraison object from a Map
  factory BonLivraison.fromMap(Map<String, dynamic> map) {
    return BonLivraison(
      id: map['id'],
      date: DateTime.parse(map['date']),
      oldReste: map['old_reste'],
      reste: map['reste'],
      payment: map['payment'],
      clientId: map['id_client'],
      userId: map['id_user'],
    );
  }
}
