class Product {
  int id;
  String barCode;
  String reference;
  String name;
  double buyingPrice;
  double sellingPrice;
  int stock;
  String photo;
  int groupId; //  foreign key to the "groupes" table
  int depositeId; //  foreign key to the "deposits" table

  Product({
    required this.id,
    required this.barCode,
    required this.reference,
    required this.name,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.stock,
    required this.photo,
    required this.groupId,
    required this.depositeId,
  });

  // Convert a Product object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bar_code': barCode,
      'reference': reference,
      'name': name,
      'buying_price': buyingPrice,
      'selling_price': sellingPrice,
      'stock': stock,
      'photo': photo,
      'id_groupe': groupId,
      'id_deposite': depositeId,
    };
  }

  // Create a Product object from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      barCode: map['bar_code'],
      reference: map['reference'],
      name: map['name'],
      buyingPrice: map['buying_price'],
      sellingPrice: map['selling_price'],
      stock: map['stock'],
      photo: map['photo'],
      groupId: map['id_groupe'],
      depositeId: map['id_deposite'],
    );
  }
}
