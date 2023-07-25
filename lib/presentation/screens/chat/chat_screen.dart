import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_friend-message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(1.3),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQoiHL8FXVWQK03RxX6Og9IFq0iGgWDLCs1LDPpKz71zzyrhUQ%26s&sp=1690311901T3936bd61e9a9a6c605d89b3799a4dc1f10e1f14067dc6c865707e544a5619208',
            ),
          ),
        ),
        title: const Text('My Friend'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const MyFriendMessageBubble()
                      : const MyMessageBubble();
                })),
        const Text('Mundo')
      ]),
    ));
  }
}
