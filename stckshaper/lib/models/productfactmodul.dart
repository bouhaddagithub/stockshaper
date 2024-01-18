class ProductFact {
  int idFact;
  int idProduct;
  double productPrice;
  int productQuantity;
  double tva;

  ProductFact({
    required this.idFact,
    required this.idProduct,
    required this.productPrice,
    required this.productQuantity,
    required this.tva,
  });

  // Convert a ProductFact object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id_fact': idFact,
      'id_prod': idProduct,
      'product_price': productPrice,
      'product_qte': productQuantity,
      'tva': tva,
    };
  }

  // Create a ProductFact object from a Map
  factory ProductFact.fromMap(Map<String, dynamic> map) {
    return ProductFact(
      idFact: map['id_fact'],
      idProduct: map['id_prod'],
      productPrice: map['product_price'],
      productQuantity: map['product_qte'],
      tva: map['tva'],
    );
  }
}
