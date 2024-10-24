class BrandModel {
  BrandModel({
    required this.id,
    required this.brandName,
    required this.brandImg,
    required this.createdAt,
    required this.updatedAt,
  });

  late final int id;
  late final String brandName;
  late final String brandImg;
  late final String createdAt;
  late final String updatedAt;

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
