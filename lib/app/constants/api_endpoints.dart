class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl =
      "https://4abf-110-44-119-186.ngrok-free.app/api/";
  // static const String baseUrl = "http://localhost:5001/api/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String getCurrentUser = "user/me";
  static const String pagination = "products/pagination";
  static const String photos = "photos";
  static const String imageUrl =
      "https://4abf-110-44-119-186.ngrok-free.app/products/";

  static const limitPage = 20;
}
