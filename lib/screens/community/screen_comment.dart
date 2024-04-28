import 'package:flutter/material.dart';
import 'package:seoul/screens/community/db_connect_test/get_db_server.dart';
import '../../models/model_board.dart';
import '../../models/model_comment.dart';
import '../../widget/bottombar/bottom_bar.dart';



class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key, required this.boardId}) : super(key: key);
  final int? boardId;


  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  var _userEnterBody = '';

  final _bodyController = TextEditingController();


  Comment createComment(){
    return Comment(
      userId: 1,
      boardId: 1,
      body: _bodyController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    var board = fetchBoard(widget.boardId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('게시글',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchBoard(widget.boardId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  var board = snapshot.data;
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.emoji_emotions_sharp), //프사가 되
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Text('${board!.userId}'),
                                  TextButton(
                                      onPressed: () {

                                      },
                                      child: Text('채팅하기'))
                                ],
                              ),
                              Text('${board.createdAt}'),
                            ],
                          )
                        ],
                      ), // 프사, 이름, 채팅하기, n분전
                      Container(height: 1, color: Colors.black,),
                      Container(
                        child: Text(
                          board.body,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ), // body
                      Container(height: 1, color: Colors.black,),
                      Text.rich(
                          TextSpan(
                              text: '좋아요',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${board.likeCnt}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: '댓글',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: '${board.commentCnt}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                              ]
                          )
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('no data avilable'),
                  );
                }
              }
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 700,
                      color: Color(0xffcfe6fb),
                    ),
                  ),
                ),
                Positioned(
                    child: FutureBuilder<List<Comment>>(
                      future: fetchComments(widget.boardId!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var comment = snapshot.data![index];
                              return Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.emoji_emotions_sharp), // 프사
                                        SizedBox(width: 10,),
                                        Text(
                                          '${comment.userId}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          )
                                        ),
                                      ],
                                    ),
                                    Text(comment.body),

                                  ],
                                ),
                              );
                            }
                          );
                        } else {
                          return Center(
                            child: Text('no data avilable'),
                          );
                        }
                      },
                    ),
                ),
                Positioned(
                  child: SizedBox(
                    width: 336, height: 42,
                    child: SearchBar(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      leading: Icon(
                        Icons.attach_file_outlined,
                        size: 18,
                        color: Color(0xff767676),
                      ),
                      hintText: "댓글을 입력하시오",
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 13,
                        color: Color(0xff767676),
                      ),
                    ),),
                  ),
                ),
                Positioned(
                  // bottom: 10, left: 18, right:18,
                  child: BottomBar(isComment: true),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
