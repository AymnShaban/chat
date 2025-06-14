part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccessState extends ChatState {
  final List<MessageModel> messagesList;

  ChatSuccessState({required this.messagesList});
}
