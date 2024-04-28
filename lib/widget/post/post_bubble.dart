import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/model_board.dart';
import '../../models/model_like.dart';
import '../../screens/community/db_connect_test/send_db_server.dart';
import '../../screens/community/screen_comment.dart';

class PostBubble extends StatelessWidget {
  const PostBubble(this.boardId, this.userId, this.body, this.likeCnt, this.commentCnt, this.createdAt, {super.key});

  final int? boardId;
  final int userId;
  final String body;
  final int likeCnt;
  final int commentCnt;
  final DateTime? createdAt;

  Like infoLike(){
    return Like(
      userId: userId,
      boardId: boardId!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffcfe6fb),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),
        ),
      ),
      width: 344,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 8),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(Icons.emoji_emotions_sharp), // 프사
              SizedBox(width: 10,),
              Text(
                '${userId}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                )
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              textAlign: TextAlign.left,
              body,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          Text.rich(
            textAlign: TextAlign.left,
            TextSpan(
              text: '좋아요 ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${likeCnt}',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              TextSpan(
                  text: '  댓글 ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '${commentCnt}',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),

              ]
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            color: Colors.white, width: 313, height: 1,),
          Row(
            children: [
                TextButton(
                  onPressed: () async {
                    await addLike(infoLike(), boardId!);
                  },
                  child: Text(
                    '좋아요',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ),
              SizedBox(width: 8,),
              TextButton(
                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentScreen(boardId: boardId),
                    ),
                  );
                },
                child: Text(
                  '댓글',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                ),
              ),
              SizedBox(width: 8,),
              TextButton(
                onPressed: (){

                },
                child: Text(
                  '채팅하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
