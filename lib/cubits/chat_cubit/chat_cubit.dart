import 'package:chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> messagesList = [];

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollection,
  );

  void sendMessage({required String data, required String email}) {
    messages.add({kMessage: data, kCreatedAt: DateTime.now(), 'id': email});
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.foromJson(doc));
      }
      emit(ChatSuccessState(messagesList: messagesList));
    });
  }
}
