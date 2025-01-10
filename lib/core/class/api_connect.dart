import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:labib/core/class/enum_states.dart';
import 'package:http/http.dart' as http;
import 'package:labib/core/constant/key.dart';
import 'package:labib/data/static/prompts.txt';
import 'package:labib/data/model/message_model.dart';

class ApiConnect {
  Future<Either<EnumStates, MessageModel>> post(List<MessageModel> messages) async {
    if(kDebugMode) {
      debugPrint(messages.map((e) => e.toJson()).toString());
    }
    try {
      var request = await http.post(Uri.parse('https://api.openai.com/v1/chat/completions'),
          body: json.encode({
            "model": "gpt-4o-mini-2024-07-18",
            "messages": [
              {"role": "developer", "content": dataai},
              ...messages.map((e) => e.toJson())
            ]
          }),
          headers: {"Content-Type": "application/json", "Authorization": "Bearer $key"});
      debugPrint(request.statusCode.toString());
      debugPrint(request.body);
      if (request.statusCode != 200) {
        return request.statusCode == 429 ? const Left(EnumStates.cost) : const Left(EnumStates.error);
      } else {
        Map<String, dynamic> json = jsonDecode(request.body);
        return Right(MessageModel.fromJson(json));
      }
    } catch (e) {
      return const Left(EnumStates.network);
    }
  }
}
