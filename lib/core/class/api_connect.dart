import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:labib/core/class/enum_states.dart';
import 'package:http/http.dart' as http;
import 'package:labib/core/constant/key.dart';
import 'package:labib/data/data_source/static/prompts.dart';
import 'package:labib/data/model/message_model.dart';

class ApiConnect {
  Future<Either<EnumStates, MessageModel>> post(List<MessageModel> messages) async {
    print(messages.map((e) => e.toJson()));
       try {
     print("object");
    var request = await http.post(Uri.parse('https://api.openai.com/v1/chat/completions'),
        body: json.encode({
          "model": "gpt-4o-mini-2024-07-18",
          "store": true,
          "messages": [
            {"role": "developer", "content": dataai},
            ...messages.map((e) => e.toJson())
          ]
        }),
        headers: {"Content-Type": "application/json", "Authorization": "Bearer $key"});
        print(request.statusCode) ;
        print(request.body) ;
  if (request.statusCode != 200) {
        return const Left(EnumStates.error);
      } else {
        Map<String, dynamic> json = jsonDecode(request.body);
        return Right(MessageModel.fromJson(json));
      }
    } catch (e) {
      return const Left(EnumStates.network);
    }
  }
}
