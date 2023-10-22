import 'dart:math';

class Product {
  int? productId;
  String? productName;
  int? aisleId;
  int? departmentId;
  double? price;
  String? image;
  int? quantity;

  Product({
    this.productId,
    this.productName,
    this.aisleId,
    this.departmentId,
    this.price,
    this.image,
    this.quantity,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    aisleId = json['aisle_id'];
    departmentId = json['department_id'];
    price = Random().nextInt(20) + 10.toDouble();
    quantity = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['aisle_id'] = aisleId;
    data['department_id'] = departmentId;
    return data;
  }
}
