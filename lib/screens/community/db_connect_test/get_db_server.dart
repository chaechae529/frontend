import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/model_board.dart';
import '../../../models/model_comment.dart';

// boardId의 댓글 불러오기
Future<List<Comment>> fetchComments(int? boardId) async {
  List<Comment> commentList = [];
  final response = await http.get(
    Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/comment/$boardId'),
  );

  if (response.statusCode == 200) {
    final result = utf8.decode(response.bodyBytes);
    List<dynamic> json = jsonDecode(result);

    for (int i =0; i < json.length; i++){
      commentList.add(Comment.fromJson(json[i]));
    }
    return commentList;
  } else {
    throw Exception('Failed to load comment');
  }
}

// 모든 게시글 목록
Future<List<Board>> fetchBoards() async {
  List<Board> boardList = [];
  final response = await http.get(
    Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/comment/boards/gold'),
  );

  if (response.statusCode == 200) {
    final result = utf8.decode(response.bodyBytes);
    List<dynamic> json = jsonDecode(result);

    for (int i =0; i < json.length; i++){
      boardList.add(Board.fromJson(json[i]));
    }
    return boardList;
  } else {
    throw Exception('Failed to load board');
  }
}

// boardId인 게시글
Future<Board> fetchBoard(int? boardId) async {
  final response = await http.get(
    Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/comment/boards/gold/${boardId}'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    return Board.fromJson(jsonData);
  } else {
    throw Exception('Failed to load board');
  }
}