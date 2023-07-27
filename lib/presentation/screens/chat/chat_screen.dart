import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_friend_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundImage: NetworkImage(              
              'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fimages.vexels.com%2Fmedia%2Fusers%2F3%2F200872%2Fisolated%2Flists%2Ff2c6cdae6e63a73d685bac6d72285308-dibujado-a-mano-color-concha.png&sp=1690480893T228310a775c0d810100c461c49926cb3775f22acb6be1b78a97696f982458ecd',
            ),
          ),
        ),
        title: const Text('¡Soy la caracola mágica!'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
    //final ScrollController chatScrollController;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.notMe)
                      ? MyFriendMessageBubble(message: message)
                      : MyMessageBubble(message : message);
                })),
        // Caja de texto
        MessageFieldBox(
          //onValue: (value) => chatProvider.sendMessage(value),
          onValue: chatProvider.sendMessage,
        ),
      ]),
    ));
  }
}
