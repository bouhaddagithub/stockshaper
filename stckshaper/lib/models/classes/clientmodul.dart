class Client {
  int id;
  String name;
  String address;
  String phoneNumber;
  double soldTotal;
  double remainingAmount;
  double paidAmount;
  double creditAmount;

  Client({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.soldTotal,
    required this.remainingAmount,
    required this.paidAmount,
    required this.creditAmount,
  });
  static Client empty() {
    return Client(
      id: 0,
      name: '',
      address: '',
      phoneNumber: '',
      soldTotal: 0,
      remainingAmount: 0,
      paidAmount: 0,
      creditAmount: 0,
    );
  }

  // Convert a Client object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone_num': phoneNumber,
      'sold_total': soldTotal,
      'reste': remainingAmount,
      'paid': paidAmount,
      'credit': creditAmount,
    };
  }

  // Create a Client object from a Map
  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      phoneNumber: map['phone_num'],
      soldTotal: map['sold_total'],
      remainingAmount: map['reste'],
      paidAmount: map['paid'],
      creditAmount: map['credit'],
    );
  }
}
