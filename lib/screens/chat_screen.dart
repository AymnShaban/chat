import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
 import 'package:chat/widgets/constants.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/main_text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  static String id = "ChatScreen";

  @override // StreamBuilder we usually use it when we wanna change the UI every moment
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: MainTexts(
          text: "hims chat",
          fontFamily: "myfont",
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(

              builder: (context, state) {
                var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(message: messagesList[index])
                        : ChatBubble2(message: messagesList[index]);
                  },
                  itemCount: messagesList.length,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 13,
              right: 13,
              bottom: 13,
              top: 4,
            ),

            child: TextField(
              controller: controller,
              autofillHints: const [AutofillHints.photo],
              cursorColor: kPrimaryColor,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context).sendMessage(data: data, email: email.toString());
                controller.clear();
                scrollController.animateTo(
                  0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
              },
              decoration: InputDecoration(
                hintText: "Send Message",
                suffixIcon: const Icon(Icons.send, color: kPrimaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
