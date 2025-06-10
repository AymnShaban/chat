import 'package:chat/models/message_model.dart';
import 'package:chat/widgets/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../widgets/chat_bubble.dart';
import '../widgets/main_text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  static String id = "ChatScreen";
  @override // StreamBuilder we usually use it when we wanna change the UI every moment change
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      // here we ordered the messages using orderBy after we added a time attribute
      builder: (context,snapshot){

        if(snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for(int i = 0 ; i < snapshot.data!.docs.length; i++){
            messagesList.add(MessageModel.foromJson(snapshot.data!.docs[i]));
          }
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
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return   messagesList[index].id == email ? ChatBubble(message:messagesList[index],) : ChatBubble2(message: messagesList[index]);},
                    itemCount: messagesList.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13,top: 4),

                  child: TextField(
                    controller: controller,
                    autofillHints: const [AutofillHints.photo],
                    cursorColor: kPrimaryColor,
                    onSubmitted: (data){
                      messages.add({
                        kMessage : data,
                        kCreatedAt : DateTime.now(),
                        'id': email
                      });
                      controller.clear();
                      scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);

                    },
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      suffixIcon: const Icon(Icons.send,color: kPrimaryColor,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: kPrimaryColor,
                              style: BorderStyle.solid
                          )

                      ),

                    ),
                  ),
                ),
              ],
            ),
          );
        }else {
          return const Center(child:CircularProgressIndicator());
        }

      },

    );
  }
}