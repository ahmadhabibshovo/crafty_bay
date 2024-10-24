class NetworkResponse {
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;
  final bool isSuccess;

  NetworkResponse(
      {required this.isSuccess,
      required this.statusCode,
      this.responseData,
      this.errorMessage = 'Something is wrong !!!'});
}
