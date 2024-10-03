class ApiResponse {
  bool success;
  String? error;
  dynamic data;

  ApiResponse({this.success = false, this.error, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      error: json['error'],
      data: json['data'],
    );
  }
}
