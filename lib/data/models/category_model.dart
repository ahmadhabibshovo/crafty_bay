class CategoryModel {
  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String categoryName;
  late final String categoryImg;
  late final String createdAt;
  late final String updatedAt;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
