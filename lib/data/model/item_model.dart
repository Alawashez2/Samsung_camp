class Item {
  int? id;
  String? name;
  String? image;
  double? price;
  String? description;

  Item({this.id, this.name, this.image, this.price, this.description});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'].toDouble();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
