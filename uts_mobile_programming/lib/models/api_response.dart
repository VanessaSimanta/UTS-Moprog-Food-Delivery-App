class ApiResponse {
  Object? data;
  String? error;
  bool success; 

  ApiResponse({this.success = false, this.data, this.error});
}

