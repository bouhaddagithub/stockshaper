class Category {
  int? id;
  String name;

  Category({
    this.id,
    required this.name,
  });
  static Category empty() {
    return Category(
      id: 0,
      name: '',
    );
  }

  // Convert a Groupe object into a Map
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

  // Create a Groupe object from a Map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}
