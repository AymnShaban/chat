import 'package:chat/widgets/constants.dart';

class MessageModel{
  final String message;
  final String id;


  MessageModel(this.message, this.id,);

  factory MessageModel.foromJson(  jsonData){
    return MessageModel(jsonData[kMessage], jsonData['id'],);
  }
}