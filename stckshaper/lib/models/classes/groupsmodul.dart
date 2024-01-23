class Groupe {
  int id;
  String name;

  Groupe({
    required this.id,
    required this.name,
  });
  static Groupe empty() {
    return Groupe(
      id: 0,
      name: '',
    );
  }

  // Convert a Groupe object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create a Groupe object from a Map
  factory Groupe.fromMap(Map<String, dynamic> map) {
    return Groupe(
      id: map['id'],
      name: map['name'],
    );
  }
}
