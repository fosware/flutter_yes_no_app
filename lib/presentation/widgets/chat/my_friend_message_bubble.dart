import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

 
class MyFriendMessageBubble extends StatelessWidget {
  final Message message;
  const MyFriendMessageBubble({Key? key, required this.message}) : super(key: key);
    
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, 
            borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
         _ImageBubble(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
final Message message;

  _ImageBubble({
   required this.message

  })

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        //'https://yesno.wtf/assets/no/15-7446b1035f784986609f456e15d30a5b.gif',
        message.imageUrl.toString(),
        width: size.width * 0.8,
        height: 160,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingprogress){
          if(loadingprogress == null) return child;
          return Container(
            width: size.width * 0.8,
            height: 160,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: const Text('sending sticker...'),
          );
        },
      )
    );
  }
}