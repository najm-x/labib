import 'package:labib/core/class/api_connect.dart';
import 'package:labib/data/model/message_model.dart';

class ChatRemote {
  final ApiConnect _apiConnect =ApiConnect() ;
 sendMessage(List<MessageModel> message) async {
  final response= await _apiConnect.post(message) ; 
  return response.fold((f)=>f, (t)=>t) ;
  }
  
}