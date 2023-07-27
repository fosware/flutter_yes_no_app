

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(
      text: '¡Conoce tu futuro!\nEscribe tu pregunta, la respuesta será: Si o No', 
      fromWho: FromWho.notMe, 
      imageUrl: 'https://awisdomwithin.files.wordpress.com/2018/10/817-181521.jpg',
      //'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fmedia.istockphoto.com%2Fid%2F1255635032%2Fvector%2Fdoodle-sketch-question-marks-set-inside-speech-bubbles.jpg%3Fs%3D612x612%26w%3D0%26k%3D20%26c%3DMUO3m5gx33HeX68MGzlULDKos_96l3BHd4zMmOmGmUo%3D&sp=1690483002Tcfd03ef7e657776578cc0a44f1e1bcbbdd00fa55d9591c1a837da7fd5e1ba83f' ,//'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcTNQkl4J_FjVQPRiRJIvniX0WGKXd-vZc23N8T4QcDn1BebYxUX%26s&sp=1690482213T862b5b0e962afc3506396353d779921e4b80bb24473c0bc84f3501aef7ac4cf4',
    ),
    //Message(text: '', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if( text.isEmpty ) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text.endsWith('?')) {
      await notMeRepy();
    }   
    
    notifyListeners();
    moveScrollToBottom();
  }

  Future notMeRepy() async {
    try{
    final notMeMessage = await getYesNoAnswer.getAnswer();
    messageList.add(notMeMessage);
    notifyListeners();
    moveScrollToBottom();
    } catch(e){
      debugPrint(e.toString());
    }
  }


  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut);
  }
}