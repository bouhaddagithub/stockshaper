class Deposit {
  int? id;
  String name;

  Deposit({
    this.id,
    required this.name,
  });
  static Deposit empty() {
    return Deposit(
      id: 0,
      name: '',
    );
  }

  // Convert a Client object into a Map
  Map<String, dynamic> toMap() {
    if (id == null) {
      return {
        'name': name,
      };
    }
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
