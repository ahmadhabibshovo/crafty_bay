class SliderModel {
  SliderModel({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.price,
    required this.image,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String title;
  late final String shortDes;
  late final String price;
  late final String image;
  late final int productId;
  late final String createdAt;
  late final String updatedAt;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['short_des'] = shortDes;
    _data['price'] = price;
    _data['image'] = image;
    _data['product_id'] = productId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
