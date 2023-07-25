
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcTUUNILJraFsrHAqPOVC-kncVrMLH48qif-U5-N_Uysf_C55Qwc%26s&sp=1690247255Te3e8d1ac9f0d7c74e698f6721cfc24443376b2ca31c15fb5bfe743cdb531d0ba',
            ),
            ),
        ),
        title: const Text('My Contact'),
        centerTitle: false,
      ),
    );
  }
}