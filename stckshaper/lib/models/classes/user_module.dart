class User {
  int? id;
  String username;
  String password;
  int isActive;

  User({
    this.id,
    required this.username,
    required this.password,
    required this.isActive,
  });

  // Convert a User object into a Map
  Map<String, dynamic> toMap() {
    if (id == null) {
      return {
        'username': username,
        'password': password,
        'l': isActive,
      };
    }
    return {
      'id': id,
      'username': username,
      'password': password,
      'l': isActive,
    };
  }

  // Create a User object from a Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      isActive: map['l'],
    );
  }
}
