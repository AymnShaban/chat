import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'main_text.dart';
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message
  });
  final MessageModel message ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,left: 8,right: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)
                  , topRight: Radius.circular(35)
              )
          ),

          child: MainTexts(
            text: message.message,
            color: Colors.white,
            fontWeight: FontWeight.w600,

          ),
        ),
      ),
    );
  }
}






class ChatBubble2 extends StatelessWidget {
  const ChatBubble2({
    super.key,
    required this.message
  });
  final MessageModel message ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6,left: 8,right: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
          decoration: const BoxDecoration(
              color: Color(0xff016E93),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)
                  , topLeft: Radius.circular(35)
              )
          ),

          child: MainTexts(
            text: message.message,
            color: Colors.white,
            fontWeight: FontWeight.w600,

          ),
        ),
      ),
    );
  }
}