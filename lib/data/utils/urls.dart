class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String listProductSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static String userLogin(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyLogin(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String listProductByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String listProductByCategory(int id) =>
      '$_baseUrl/ListProductByCategory/$id';
}
