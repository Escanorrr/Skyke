
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationUserAvatarWidget extends StatelessWidget {
  const ConversationUserAvatarWidget({Key? key, this.imageLink}) : super(key: key);

  @required
  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: Image.asset("assets/images/logo.png").image,
        //foregroundImage: NetworkImage('${imageLink}'),
        foregroundImage: Image.asset("assets/images/Riyad.png").image,
        radius: 40,
      ),
      //decoration the border circular
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }
}
