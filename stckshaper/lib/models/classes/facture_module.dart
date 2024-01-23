class Facture {
  int? id;
  DateTime date;
  DateTime? updateDate;
  DateTime? updateTime;
  double solde;
  double reste;
  double payment;
  int clientId; //  foreign key to the "clients" table
  int sellerId; // foreign key to the "sellers" table
  String type;

  Facture({
    this.id,
    required this.date,
    this.updateDate,
    this.updateTime,
    required this.solde,
    required this.reste,
    required this.payment,
    required this.clientId,
    required this.sellerId,
    required this.type,
  });

  // Convert a Facture object into a Map
  Map<String, dynamic> toMap() {
    if (id == null) {
      return {
        'date': date.toIso8601String(),
        'update_date': updateDate?.toIso8601String(),
        'update_time': updateTime?.toIso8601String(),
        'solde': solde,
        'reste': reste,
        'payment': payment,
        'id_client': clientId,
        'id_seller': sellerId,
        'type': type,
      };
    }
    return {
      'id': id,
      'date': date.toIso8601String(),
      'update_date': updateDate?.toIso8601String(),
      'update_time': updateTime?.toIso8601String(),
      'solde': solde,
      'reste': reste,
      'payment': payment,
      'id_client': clientId,
      'id_seller': sellerId,
      'type': type,
    };
  }

  // Create a Facture object from a Map
  factory Facture.fromMap(Map<String, dynamic> map) {
    return Facture(
      id: map['id'],
      date: DateTime.parse(map['date']),
      updateDate: map['update_date'] != null
          ? DateTime.parse(map['update_date'])
          : null,
      updateTime: map['update_time'] != null
          ? DateTime.parse(map['update_time'])
          : null,
      solde: map['solde'],
      reste: map['reste'],
      payment: map['payment'],
      clientId: map['id_client'],
      sellerId: map['id_seller'],
      type: map['type'],
    );
  }
}
