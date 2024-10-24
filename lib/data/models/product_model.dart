import 'brand_model.dart';
import 'category_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.stock,
    required this.star,
    required this.remark,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    required this.brand,
    required this.category,
  });
  late final int id;
  late final String title;
  late final String shortDes;
  late final String price;
  late final int discount;
  late final String discountPrice;
  late final String image;
  late final int stock;
  late final int star;
  late final String remark;
  late final int categoryId;
  late final int brandId;
  late final String createdAt;
  late final String updatedAt;
  late final BrandModel brand;
  late final CategoryModel category;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = BrandModel.fromJson(json['brand']);
    category = CategoryModel.fromJson(json['category']);
  }
}
