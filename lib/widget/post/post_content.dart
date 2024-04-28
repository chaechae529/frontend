import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seoul/screens/community/db_connect_test/get_db_server.dart';
import 'package:seoul/widget/post/post_bubble.dart';

import '../../models/model_board.dart';

class Content extends StatelessWidget {
  const Content({super.key});


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Board>>(
        future: fetchBoards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Board board = snapshot.data![index];
                return PostBubble(
                  board.id,
                  board.userId,
                  board.body,
                  board.likeCnt,
                  board.commentCnt,
                  board.createdAt,
                );
              },
            );
          } else {
            return Center(
              child: Text('no data avilable'),
            );
          }
        }
    );
  }
}
