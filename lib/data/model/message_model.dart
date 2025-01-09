import 'dart:convert';

class MessageModel {
  final String nameSender ;
  final String message;

  MessageModel({required this.nameSender, required this.message});
 factory MessageModel.fromJson(Map<String, dynamic> json) {
  String m = json["choices"][0]["message"]['content'];
  String r = json["choices"][0]["message"]['role'];
    return MessageModel(
      message: utf8.decode(m.runes.toList()),
      nameSender:  utf8.decode(r.runes.toList()),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'role': nameSender,
      'content': message,
    };
  }
}