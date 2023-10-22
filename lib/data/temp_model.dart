class Temp {
  String? name;
  String? image;
  double? price;

  Temp({this.name, this.image, this.price});

  Temp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    return data;
  }
}
