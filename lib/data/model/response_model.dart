class ResponseModel {
  final String message;
  final String role;

  ResponseModel({required this.message, required this.role});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json["choices"][0]["message"]['content'],
      role:  json["choices"][0]["message"]['role'],
    );
  }
}
