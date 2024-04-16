import 'package:flutter/material.dart';

class PostBubble extends StatelessWidget {
  const PostBubble(this.title, this.content, this.like, this.comment, {super.key});

  final String title;
  final String content;
  final String like;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffcfe6fb),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),
            ),
          ),
          width: 344,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_emotions_sharp),
                  Text(title),
                ],
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(like),
                  Text(comment),
                ],
              ),
              Container(color: Colors.white, width: 313, height: 1,),
              Row(
                children: [
                  Text('좋아요'),
                  Text('댓글'),
                  Text('채팅하기'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
