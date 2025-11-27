
class ProductsModel {
  String? id;
  String? name;
  String? description;
  double? price;
  double? offerPrice;

  ProductsModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.offerPrice,
  });

  ProductsModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? offerPrice,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'offerPrice': offerPrice,
    };
  }

 

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      offerPrice: map['offerPrice'] != null ? map['offerPrice'] as double : null,
    );
  }

}