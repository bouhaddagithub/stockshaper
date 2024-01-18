class Deposit {
  int id;
  String name;

  Deposit({
    required this.id,
    required this.name,
  });

  // Convert a Client object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create a Client object from a Map
  factory Deposit.fromMap(Map<String, dynamic> map) {
    return Deposit(
      id: map['id'],
      name: map['name'],
    );
  }
}
